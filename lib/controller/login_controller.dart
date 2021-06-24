import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow/auth/authController.dart';

// ignore: camel_case_types
class loginControler {
  final authController = AuthController();

  Future<Void> googleSigin(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final response = await _googleSignIn.signIn();
      authController.setUser(context, response);
      print(response);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}
