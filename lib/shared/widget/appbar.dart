import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
import 'package:pay_flow/shared/themes/apptextstyles.dart';

class appBarUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                title: Text.rich(
                  TextSpan(
                      text: "Olá ",
                      style: TextStyles.titleRegular,
                      children: [
                        TextSpan(
                            text: "Keven",
                            style: TextStyles.titleBoldBackground)
                      ]),
                ),
                subtitle: Text("Mantenha suas contas em dia",
                    style: TextStyles.captionShape),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            )));
  }
}
