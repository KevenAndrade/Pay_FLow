import 'package:flutter/material.dart';
import 'package:pay_flow/modules/home.dart';
import 'package:pay_flow/modules/splash.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';

import 'modules/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: Splashpage(),
    ); //Splashpage HomePage Loginpage
  }
}

