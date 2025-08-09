import 'package:auth_screens/screens/forgot_password.dart';
import 'package:auth_screens/screens/sign_up.dart';
import 'package:auth_screens/widgets/button.dart';
import 'package:auth_screens/widgets/header.dart';
import 'package:auth_screens/widgets/social_card.dart';
import 'package:auth_screens/widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Header(),
                  CustomTextField(
                    labelText: 'Email or username',
                    hintText: 'Enter email or username',
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    textController: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    obscureText: showPassword ? false : true,
                    labelText: 'Password',
                    hintText: 'Enter password',
                    textController: passwordController,
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.remove_red_eye),
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    child: Text('Forgot password?'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 32),

                  // Login button
                  Button(
                    label: 'Sign In',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Signing you in...')),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Don\'t have an account?'),
                        TextSpan(
                          text: ' Sign Up',
                          style: TextStyle(fontWeight: FontWeight.w700),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUp(),
                                    ),
                                  );
                                },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),
                  Text('or', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 24),

                  // Social Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SocialCard(
                        imagePath: 'assets/images/facebook_logo.png',
                        onTap: () {},
                      ),
                      SocialCard(
                        imagePath: 'assets/images/instagram_logo.png',
                        onTap: () {},
                      ),
                      SocialCard(
                        imagePath: 'assets/images/apple_logo.png',
                        onTap: () {},
                      ),
                      SocialCard(
                        imagePath: 'assets/images/twitter_logo.png',
                        onTap: () {},
                      ),
                    ],
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
    passwordController.dispose();
    super.dispose();
  }
}
