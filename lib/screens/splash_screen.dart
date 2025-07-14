import 'package:auth_project/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1,), (){
      final authProvider = context.read<AuthProvider>();
      if(authProvider.isLogIn){
        Navigator.pushReplacementNamed(context, '/home_page');
      }else{
        Navigator.pushReplacementNamed(context, '/login_page');
      }
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
