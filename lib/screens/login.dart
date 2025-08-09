import 'package:auth_screens/screens/forgot_password.dart';
import 'package:auth_screens/screens/sign_up.dart';
import 'package:auth_screens/widgets/button.dart';
import 'package:auth_screens/widgets/rounded_container.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SingleChildScrollView(
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
                CustomTextField(
                  labelText: 'Email or username',
                  hintText: 'Enter email or username',
                  prefixIcon: Icon(Icons.email, color: Colors.white),
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
                ),
                SizedBox(height: 8),
                GestureDetector(child: Text('Forgot password?'), onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
                },),
                SizedBox(height: 32),
                Button(label: 'Sign In', onPressed: () {}),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: RoundedContainer(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: Image.asset('assets/images/facebook_logo.png'),
                      ),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: RoundedContainer(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: Image.asset('assets/images/instagram_logo.png'),
                      ),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: RoundedContainer(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: Image.asset('assets/images/apple_logo.png'),
                      ),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: RoundedContainer(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: Image.asset('assets/images/twitter_logo.png'),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
