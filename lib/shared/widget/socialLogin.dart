import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/appimages.dart';
import 'package:pay_flow/shared/themes/apptextstyles.dart';

class Sociallogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(
        children: [
          Expanded(child: Image.asset(AppImages.google)),
          Expanded(child: Text("Entrar com Google", style:TextStyles.buttonGray))
        ],
      )
    );
  }
}