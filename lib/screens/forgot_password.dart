import 'package:auth_screens/widgets/button.dart';
import 'package:auth_screens/widgets/header.dart';
import 'package:auth_screens/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Header(),
                  Image.asset('assets/images/forgot_password.png', height: 300),
                  CustomTextField(
                    textController: emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email',
                    hintText: 'Enter email',
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'By continuing, you agree to the Terms and Conditions',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Button
                  Button(
                    label: 'Forgot Password',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Sending email...')),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
