import 'package:auth_project/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.cyan,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            context.read<AuthProvider>().logOut();
            Future.delayed(Duration(seconds: 2), (){
              Navigator.pushReplacementNamed(context, '/login_page');//for checking the status change
            });

          }, icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Welcome User You Are Logged In"),
            Text('Status: ${context.watch<AuthProvider>().isLogIn}'),
          ],
        ),
      ),
    );
  }
}
