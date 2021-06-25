import 'package:flutter/Material.dart';
import 'package:pay_flow/modules/barcodeScaner.dart';
import 'package:pay_flow/modules/home.dart';
import 'package:pay_flow/modules/login.dart';
import 'package:pay_flow/modules/splash.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash" : (context) => Splashpage(),
        "/home" : (context) => HomePage(),
        "/login" : (context) => Loginpage(),
        "/barcode" : (context) => BarcodeScanerPage()
      },
    );
  }
}