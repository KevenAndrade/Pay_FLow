import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return BottonSheet(
        primero: "Escanear novamente",
        segundo: "Digitar codigo",
        primerof: () {},
        segundof: () {},
        title: "Não foi possivel identificar um codigo",
        subtitle: "Tente escrevernovamente ou digite o codigo do seu boleto.");
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
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
                    child:
                        Container(color: Colors.transparent.withOpacity(0.6))),
                Expanded(child: Container(color: Colors.black)),
              ],
            ),
            bottomNavigationBar: setlabelbutton(
                primero: "Inserir código da fatura",
                segundo: "Adicionar da galeria",
                primerof: () {},
                segundof: () {})),
      ),
    );
  }
}
