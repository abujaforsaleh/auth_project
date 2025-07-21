import 'dart:developer';
import 'package:dio/dio.dart';
import 'dio_client.dart';

class AuthService {
  final Dio _dio = DioClient.dio;

  Future<bool> login(String email, String password) async {
    try {
      final res = await _dio.post('/login', data: {
        'email': email,
        'password': password,
      });

      log('Login success: ${res.data}');
      return true;
    } on DioException catch (e) {
      log('Login error: ${e.response?.data ?? e.message}');
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    try {
      final res = await _dio.post('/register', data: {
        'email': email,
        'password': password,
      });

      log('Register success: ${res.data}');
      return true;
    } on DioException catch (e) {
      log('Register error: ${e.response?.data ?? e.message}');
      return false;
    }
  }

  Future<bool> verifyOtp(String code) async {
    try {
      final res = await _dio.post('/verify-otp', data: {
        'otp': code,
      });

      log('OTP verified: ${res.data}');
      return true;
    } on DioException catch (e) {
      log('OTP verify error: ${e.response?.data ?? e.message}');
      return false;
    }
  }
}