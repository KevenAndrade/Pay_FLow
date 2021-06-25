import 'package:flutter/material.dart';
import 'package:pay_flow/modules/buttons.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
import 'package:pay_flow/shared/themes/apptextstyles.dart';

class BarcodeScanerPage extends StatefulWidget {
  @override
  _BarcodeScanerPageState createState() => _BarcodeScanerPageState();
}

class _BarcodeScanerPageState extends State<BarcodeScanerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Escaneie o codigo da fatura",
                style: TextStyles.buttonBackground),
            leading: BackButton(
              color: AppColors.background,
            )),
        body: Column(
          children: [
            Expanded(child: Container(color: Colors.black)),
            Expanded(flex: 2, child: Container(color: Colors.transparent)),
            Expanded(child: Container(color: Colors.black)),
          ],
        ),
        bottomNavigationBar: LabelButton(label: "Label", onPressed: () {}));
  }
}
