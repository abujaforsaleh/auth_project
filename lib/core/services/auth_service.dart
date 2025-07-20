import 'dart:developer';

class AuthService {
  Future<bool> login(String email, String password) async {
    log('API CALL: login() - $email / $password');
    await Future.delayed(const Duration(seconds: 2)); // Simulate network
    return email == "demo@mail.com" && password == "123456";
  }

  Future<bool> register(String email, String password) async {
    log('API CALL: register() - $email / $password');
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> verifyOtp(String code) async {
    log('API CALL: verifyOtp() - code: $code');
    await Future.delayed(const Duration(seconds: 2));
    return code == "123456"; // pretend 123456 is the correct OTP
  }
}
