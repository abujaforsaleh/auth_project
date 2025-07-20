import 'package:auth_project/routs/app_routs.dart';
import 'package:flutter/material.dart';

import '../core/services/auth_service.dart';
import '../core/uitls/app_globals.dart';
import '../screens/otp_screen.dart';


class AuthProvider extends ChangeNotifier{

  final AuthService _authService = AuthService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login (String email, String password)async{
    _isLoading = true;
    notifyListeners();

    final success = await _authService.login(email, password);

    debugPrint("login with email: $email, password: $password");

    _isLoading = false;
    notifyListeners();

    if (success) {
      Navigator.pushReplacementNamed(navigatorKey.currentContext!, '/home_page');
    } else {
      _showError('Invalid credentials');
    }
  }

  Future<void> register(String email, String password)async{
    _isLoading = true;
    notifyListeners();

    final success = await _authService.register(email, password);
    debugPrint("Registering with email: $email, password: $password");

    _isLoading = false;
    notifyListeners();

    // Navigate to OTP screen

    if (success) {
      Navigator.pushNamed(
        navigatorKey.currentContext!,
        AppRoutes.otpScreen,
      );
    } else {
      _showError('Registration failed');
    }

  }
  Future<void> verifyOtp(String code) async {
    _isLoading = true;
    notifyListeners();

    final success = await _authService.verifyOtp(code);
    debugPrint('OTP Verified: $code');

    _isLoading = false;
    notifyListeners();
    if (success) {
      Navigator.pushReplacementNamed(navigatorKey.currentContext!, '/home_page');
    } else {
      _showError('Invalid OTP');
    }
    // You could navigate to home screen here after verification
  }
  void _showError(String message) {
    final context = navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }



}