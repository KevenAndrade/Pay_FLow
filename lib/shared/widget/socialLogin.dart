import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
import 'package:pay_flow/shared/themes/appimages.dart';
import 'package:pay_flow/shared/themes/apptextstyles.dart';

class Sociallogin extends StatelessWidget {
  final VoidCallback onTap;

  const Sociallogin({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: onTap,
          child: Container(
          height: 56,
          decoration: BoxDecoration(
              color: AppColors.shape,
              borderRadius: BorderRadius.circular(5),
              border: Border.fromBorderSide(BorderSide(color: AppColors.stroke))),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.google),
                      SizedBox(width: 16),
                      Container(height: 56, width: 1, color: AppColors.stroke)
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: Text("Entrar com Google", style: TextStyles.buttonGray))
            ],
          )),
    );
  }
}
