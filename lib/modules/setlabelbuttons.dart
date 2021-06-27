import 'package:flutter/cupertino.dart';
import 'package:pay_flow/modules/buttons.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
import 'package:pay_flow/shared/themes/apptextstyles.dart';

class setlabelbutton extends StatelessWidget {
  final String primero;
  final String segundo;
  final VoidCallback primerof;
  final VoidCallback segundof;
  final bool enableprimaricollor;

  const setlabelbutton(
      {Key? key,
      required this.primero,
      required this.segundo,
      required this.primerof,
      required this.segundof,
      this.enableprimaricollor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(children: [
        Expanded(
            child: LabelButton(
          label: primero,
          onPressed: primerof,
          style: enableprimaricollor ? TextStyles.buttonPrimary : null,
        )),
        div(),
        Expanded(
            child: LabelButton(
          label: segundo,
          onPressed: segundof,
        ))
      ]),
    );
  }
}

Widget div() {
  return Container(
      width: 2, height: double.maxFinite, child: null, color: AppColors.stroke);
}
