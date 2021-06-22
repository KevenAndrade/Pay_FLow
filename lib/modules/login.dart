import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
import 'package:pay_flow/shared/themes/appimages.dart';

class Loginpage extends StatefulWidget {
  Loginpage({Key key}) : super(key: key);
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.3,
              color: AppColors.primary,
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Image.asset(AppImages.person)
            )
          ],
        ));
  }
}
