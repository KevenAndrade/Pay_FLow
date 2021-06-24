import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/modules/login.dart';

class AuthController {
  var _isAuthenticated = false;
  var _user;

  get user => _user;

  void setUser(BuildContext context, var user) {
    if (user != null) {
      _isAuthenticated = true;
      _user = user;
      Navigator.pushReplacementNamed(
          context, "/home");
    } else {
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(
          context, "/login");
    }
  }
}
