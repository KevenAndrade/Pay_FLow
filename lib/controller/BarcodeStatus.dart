import 'package:camera/camera.dart';

class BarcodeStatus {
  final bool isCameraAvaible;
  final String error;
  final String barcode;

  CameraController? cameraController;

  BarcodeStatus({
    this.isCameraAvaible = false,
    this.cameraController,
    this.error = "",
    this.barcode = "",
  });

  factory BarcodeStatus.available(CameraController controller) => BarcodeStatus(
        isCameraAvaible: true,
        cameraController: controller,
      );

  factory BarcodeStatus.error(String message) => BarcodeStatus(
        error: message,
      );
  
   factory BarcodeStatus.barcode(String barcode) => BarcodeStatus(
        barcode: barcode,
      );


  bool get showCamera => isCameraAvaible && error.isEmpty;
  bool get hasError => error.isNotEmpty;
  bool get hasBarcode => barcode.isNotEmpty;
}
