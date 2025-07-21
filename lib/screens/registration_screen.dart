import 'package:auth_project/provider/auth_provider.dart';
import 'package:auth_project/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _emailController = TextEditingController(text: "example@gmail.com");
  final _passwordConteroller = TextEditingController(text: "1234566");
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordConteroller.dispose();
  }

  void _submitRegister() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordConteroller.text;
      Provider.of<AuthProvider>(context, listen: false)
          .register(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
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
                  validatorValue: "Enter a proper email"),
              SizedBox(
                height: 16,
              ),
              customTextfield(
                  controller: _passwordConteroller,
                  inputType: TextInputType.visiblePassword,
                  labelText: "Password",
                  validatorValue: "Enter a strong password"),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: authProvider.isLoading ? null : _submitRegister,
                child: authProvider.isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text('Register'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login_page');
                },
                child: Text(
                  "Already have an account? Login",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
