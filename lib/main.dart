import 'package:auth_project/provider/auth_provider.dart';
import 'package:auth_project/screens/home_screen.dart';
import 'package:auth_project/screens/login_screen.dart';
import 'package:auth_project/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Flutter Auth',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/login_page': (context)=> LoginScreen(),
          '/home_page': (context)=> HomeScreen(),
          '/register_page': (context)=> RegistrationScreen()
        },
        initialRoute: '/login_page',
      ),
    );
  }
}

