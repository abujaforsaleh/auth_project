import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  bool _isLogIn = false;

  bool get isLogIn =>_isLogIn;

  logOut(){
    _isLogIn = false;
    notifyListeners();
  }
  logIn(){
    _isLogIn = true;
    notifyListeners();
  }

}