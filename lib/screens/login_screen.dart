import 'package:auth_project/provider/auth_provider.dart';
import 'package:auth_project/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: "example@gmail.com");
  final _passwordController = TextEditingController(text: "123456");
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text;
      Provider.of<AuthProvider>(context, listen: false).login(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              customTextfield(
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                  labelText: "Email",
                  validatorValue: "Enter email address"),
              SizedBox(
                height: 16,
              ),
              customTextfield(
                  controller: _passwordController,
                  inputType: TextInputType.visiblePassword,
                  labelText: "Password",
                  validatorValue: "Enter a Password"),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: authProvider.isLoading ? null : _submitLogin,
                child: authProvider.isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
