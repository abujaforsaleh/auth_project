import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> login (String email, String password)async{
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    debugPrint("login with email: $email, password: $password");

    _isLoading = false;
    notifyListeners();
  }

  Future<void> register(String email, String password)async{
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));
    debugPrint("Registering with email: $email, password: $password");

    _isLoading = false;
    notifyListeners();

  }

}