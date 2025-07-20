import 'package:auth_project/routs/app_routs.dart';
import 'package:flutter/material.dart';

import '../core/uitls/app_globals.dart';
import '../screens/otp_screen.dart';


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

    // Navigate to OTP screen
    Navigator.pushNamed(
      navigatorKey.currentContext!,
      AppRoutes.otpScreen,
    );

  }
  Future<void> verifyOtp(String code) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2)); // Simulate API
    debugPrint('OTP Verified: $code');

    _isLoading = false;
    notifyListeners();

    // You could navigate to home screen here after verification
  }


}