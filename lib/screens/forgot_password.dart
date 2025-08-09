import 'package:auth_screens/widgets/button.dart';
import 'package:auth_screens/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Surya',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontFamily: 'Lavishly_Yours',
                  ),
                ),
                SizedBox(height: 50),
                Image.asset('assets/images/forgot_password.png', height: 300),
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'Enter email',
                  prefixIcon: Icon(Icons.email, color: Colors.white),
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
                Button(label: 'Forgot Password', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
