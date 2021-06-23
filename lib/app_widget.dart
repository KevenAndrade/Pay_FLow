import 'package:flutter/Material.dart';
import 'package:pay_flow/modules/login.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: Loginpage(),
    ); //Splashpage HomePage Loginpage
  }
}