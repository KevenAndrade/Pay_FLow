import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_flow/controller/BarcodeStatus.dart';

class BarcodeController {
  BarcodeStatus status = new BarcodeStatus();
  final barcodeScaner = GoogleMlKit.vision.barcodeScanner();

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
      status = BarcodeStatus.available(cameraController);
      scanWithCamera();
    } catch (e) {
      status = BarcodeStatus.error(e.toString());
    }
  }

  void scanWithCamera() {
    Future.delayed(Duration(seconds: 10)).then((value) => {
          if (status.cameraController != null)
            {
              if (status.cameraController!.value.isStreamingImages)
                {status.cameraController!.stopImageStream()}
            }
        });
    listenCamera();
  }

  Future<void> scanerBarcode(InputImage inputImage) async {
    try {
      if (status.cameraController != null) {
        status.cameraController!.stopImageStream();
      }
      final barcodes = await barcodeScaner.processImage(inputImage);
      var barcode;

      for (Barcode item in barcodes) {
        barcode = item.value.displayValue;
      }

      if (barcode != null && status.barcode.isEmpty) {
        status = BarcodeStatus.barcode(barcode);
        status.cameraController!.dispose();
      } else {
        getAvailableCamera();
      }
    } catch (e) {
      print("Erro na leitura");
    }
  }

  void scanWithImagePicker() async {
    await status.cameraController!.stopImageStream();
    final response = await ImagePicker().getImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(response!.path);
    scanerBarcode(inputImage);
  }

  void listenCamera() {
    if (status.cameraController!.value.isStreamingImages == false)
      status.cameraController!.startImageStream((cameraImage) async {
        try {
          final WriteBuffer allBytes = WriteBuffer();
          for (Plane plane in cameraImage.planes) {
            allBytes.putUint8List(plane.bytes);
          }
          final bytes = allBytes.done().buffer.asUint8List();
          final Size imageSize =
              Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());

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
          await Future.delayed(Duration(seconds: 3));
          await scanerBarcode(inputImage);
        } catch (e) {
          print(e);
        }
      });
  }
}
