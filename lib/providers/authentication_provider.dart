import 'package:flutter/material.dart';


class AuthenticationProvider with ChangeNotifier{

  // variables

  bool? _isLoginPage = true; // App goes to LoginPage first



// Getter and Setter


  bool get isLoginPage => _isLoginPage!;
  set isLoginPage(bool value) {
    _isLoginPage = value;
    notifyListeners();
  }














  // Methods








}