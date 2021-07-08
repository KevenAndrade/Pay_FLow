import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_flow/controller/BarcodeStatus.dart';

class BarcodeController {
  final statusNotifier = ValueNotifier<BarcodeStatus>(BarcodeStatus());

  BarcodeStatus get status => statusNotifier.value;
  set status(BarcodeStatus status) => statusNotifier.value = status;

  final barcodeScaner = GoogleMlKit.vision.barcodeScanner();

  InputImage? inputPicker;
  CameraController? cameraController;

  void getAvailableCamera() async {
    try {
      final respose = await availableCameras();
      final camera = respose.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.back,
      );
      final cameraController = CameraController(
        camera,
        ResolutionPreset.max,
        enableAudio: false,
      );
      await cameraController.initialize();
      scanWithCamera();
      listenCamera();
    } catch (e) {
      status = BarcodeStatus.error(e.toString());
    }
  }

  void scanWithCamera() {
    status = BarcodeStatus.available();
    Future.delayed(Duration(seconds: 20)).then((value) => {
          if (status.hasBarcode == false){
            status = BarcodeStatus.error("Timeout de leitura de boleto")
          }
        });
  }

  Future<void> scanerBarcode(InputImage inputImage) async {
    try {
      final barcodes = await barcodeScaner.processImage(inputImage);
      var barcode;

      for (Barcode item in barcodes) {
        barcode = item.value.displayValue;
      }

      if (barcode != null && status.barcode.isEmpty) {
        status = BarcodeStatus.barcode(barcode);
        cameraController!.dispose();
        await barcodeScaner.close();
      }

      return;
    } catch (e) {
      print("Erro na leitura");
    }
  }

  void scanWithImagePicker() async {
    final response = await ImagePicker().getImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(response!.path);
    scanerBarcode(inputImage);
  }

  void listenCamera() {
    if (cameraController!.value.isStreamingImages == false)
      cameraController!.startImageStream((cameraImage) async {
        if (status.stopScaner == false) {
          try {
            final WriteBuffer allBytes = WriteBuffer();
            for (Plane plane in cameraImage.planes) {
              allBytes.putUint8List(plane.bytes);
            }
            final bytes = allBytes.done().buffer.asUint8List();
            final Size imageSize = Size(
                cameraImage.width.toDouble(), cameraImage.height.toDouble());

            final InputImageRotation imageRotation =
                InputImageRotation.Rotation_0deg;

            final InputImageFormat inputImageFormat =
                InputImageFormatMethods.fromRawValue(cameraImage.format.raw) ??
                    InputImageFormat.NV21;

            final planeData = cameraImage.planes.map(
              (Plane plane) {
                return InputImagePlaneMetadata(
                  bytesPerRow: plane.bytesPerRow,
                  height: plane.height,
                  width: plane.width,
                );
              },
            ).toList();

            final inputImageData = InputImageData(
              size: imageSize,
              imageRotation: imageRotation,
              inputImageFormat: inputImageFormat,
              planeData: planeData,
            );

            final inputImage = InputImage.fromBytes(
              bytes: bytes,
              inputImageData: inputImageData,
            );
            scanerBarcode(inputImage);
          } catch (e) {
            print(e);
          }
        }
      });
  }

  void dispose() {
    statusNotifier.dispose();
    barcodeScaner.close();
    if (status.showCamera) {
      cameraController!.dispose();
    }
  }
}
