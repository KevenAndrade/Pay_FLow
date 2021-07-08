import 'package:flutter/material.dart';
import 'package:pay_flow/controller/BarcodeController.dart';
import 'package:pay_flow/controller/BarcodeStatus.dart';
import 'package:pay_flow/modules/buttons.dart';
import 'package:pay_flow/modules/setlabelbuttons.dart';
import 'package:pay_flow/shared/bottonSheet.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
import 'package:pay_flow/shared/themes/apptextstyles.dart';

class BarcodeScanerPage extends StatefulWidget {
  @override
  _BarcodeScanerPageState createState() => _BarcodeScanerPageState();
}

class _BarcodeScanerPageState extends State<BarcodeScanerPage> {
  final controller = BarcodeController();

  @override
  void initState() {
    controller.getAvailableCamera();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, '/insert_boleto');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*  */
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                    child: controller.cameraController!.buildPreview());
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.black,
                    title: Text("Escaneie o codigo da fatura",
                        style: TextStyles.buttonBackground),
                    leading: BackButton(
                      color: AppColors.background,
                    )),
                body: Column(
                  children: [
                    Expanded(child: Container(color: Colors.black)),
                    Expanded(
                        flex: 2,
                        child: Container(
                            color: Colors.transparent.withOpacity(0.6))),
                    Expanded(child: Container(color: Colors.black)),
                  ],
                ),
                bottomNavigationBar: setlabelbutton(
                    primero: "Inserir código da fatura",
                    segundo: "Adicionar da galeria",
                    primerof: () {},
                    segundof: () {})),
          ),
          ValueListenableBuilder<BarcodeStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return BottonSheet(
                    primero: "Escanear novamente",
                    segundo: "Digitar codigo",
                    primerof: () {
                      controller.scanWithCamera();
                    },
                    segundof: () {},
                    title: "Não foi possivel identificar um codigo",
                    subtitle:
                        "Tente escrevernovamente ou digite o codigo do seu boleto.");
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
