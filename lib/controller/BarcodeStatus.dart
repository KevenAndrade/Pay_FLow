import 'package:camera/camera.dart';

class BarcodeStatus {
  final bool isCameraAvaible;
  final String error;
  final String barcode;
  final bool stopScaner;

  BarcodeStatus({
    this.isCameraAvaible = false,
    this.error = "",
    this.barcode = "",
    this.stopScaner = false
  });

  factory BarcodeStatus.available() => BarcodeStatus(
        isCameraAvaible: true,
        stopScaner:false
      );

  factory BarcodeStatus.error(String message) => BarcodeStatus(
        error: message,
        stopScaner: true
      );

  factory BarcodeStatus.barcode(String barcode) => BarcodeStatus(
        barcode: barcode,
        stopScaner: true
      );

  bool get showCamera => isCameraAvaible && error.isEmpty;
  bool get hasError => error.isNotEmpty;
  bool get hasBarcode => barcode.isNotEmpty;
}
