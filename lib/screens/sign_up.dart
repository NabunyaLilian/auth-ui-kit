import 'package:auth_screens/screens/login.dart';
import 'package:auth_screens/widgets/button.dart';
import 'package:auth_screens/widgets/header.dart';
import 'package:auth_screens/widgets/social_card.dart';
import 'package:auth_screens/widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showPassword = false;
  bool showPasswordConfirm = false;

  final formKey = GlobalKey<FormState>();

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: CustomTextField(
                          labelText: 'Firstname',
                          hintText: 'Enter Firstname',
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                          textController: firstnameController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter first name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Flexible(
                        child: CustomTextField(
                          labelText: 'Lastname',
                          hintText: 'Enter Lastname',
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                          textController: lastnameController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter last name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    labelText: 'Email',
                    hintText: 'Enter email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    textController: emailController,
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
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.remove_red_eye),
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                    textController: passwordController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    obscureText: showPasswordConfirm ? false : true,
                    labelText: 'Confirm Password',
                    hintText: 'Enter password',
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.remove_red_eye),
                      onTap: () {
                        setState(() {
                          showPasswordConfirm = !showPasswordConfirm;
                        });
                      },
                    ),
                    textController: confirmPasswordController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please confirm password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Already have an account?'),
                        TextSpan(
                          text: ' Sign In',
                          style: TextStyle(fontWeight: FontWeight.w700),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),

                  // Register Button
                  Button(
                    label: 'Register',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Registering you in a bit..')),
                        );
                      }
                    },
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
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
