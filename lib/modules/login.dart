import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
import 'package:pay_flow/shared/themes/appimages.dart';
import 'package:pay_flow/shared/themes/apptextstyles.dart';
import 'package:pay_flow/shared/widget/socialLogin.dart';

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
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.36,
                color: AppColors.primary,
              ),
              Positioned(
                  top: 48,
                  left: 0,
                  right: 0,
                  child:
                      Image.asset(AppImages.person, width: 208, height: 300)),
              Positioned(
                left: 0,
                right: 0,
                bottom: size.height * 0.05,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.logomini),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 70, left: 70),
                        child: Text(
                          "Organize suas faturas num só lugar",
                          textAlign: TextAlign.center,
                          style: TextStyles.titleHome,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 40, left: 40, top: 30),
                        child: Sociallogin(onTap: () {
                          print("LOGANDO");
                        }),
                      )
                    ]),
              ),
            ],
          ),
        ));
  }
}
