import 'package:flutter/material.dart';
import 'package:pay_flow/modules/setlabelbuttons.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
import 'package:pay_flow/shared/themes/apptextstyles.dart';

class BottonSheet extends StatelessWidget {
  final title;
  final subtitle;
  final primero;
  final segundo;
  final primerof;
  final segundof;

  const BottonSheet(
      {Key? key,
      required this.primero,
      required this.segundo,
      required this.primerof,
      required this.segundof,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Material(
        child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                    child: Container(color: Colors.black.withOpacity(0.6))),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                            text: title,
                            style: TextStyles.buttonBoldHeading,
                            children: [
                              TextSpan(
                                text: "\n$subtitle",
                                style: TextStyles.buttonHeading,
                              )
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(color: AppColors.stroke, height: 2),
                    setlabelbutton(
                        enableprimaricollor: true,
                        primero: primero,
                        segundo: segundo,
                        primerof: primerof,
                        segundof: segundof)
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
