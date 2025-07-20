import 'package:auth_project/provider/auth_provider.dart';
import 'package:auth_project/routs/app_routs.dart';
import 'package:auth_project/screens/home_screen.dart';
import 'package:auth_project/screens/login_screen.dart';
import 'package:auth_project/screens/otp_screen.dart';
import 'package:auth_project/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/uitls/app_globals.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Flutter Auth',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.login,
          routes: {
            AppRoutes.login: (_) => LoginScreen(),
            AppRoutes.register: (_) => RegistrationScreen(),
            AppRoutes.home: (_) => HomeScreen(),
            AppRoutes.otpScreen: (_) => OtpScreen(),
          }

      ),
    );
  }
}

