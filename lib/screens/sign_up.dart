import 'package:auth_screens/screens/login.dart';
import 'package:auth_screens/widgets/button.dart';
import 'package:auth_screens/widgets/rounded_container.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: CustomTextField(
                        labelText: 'Firstname',
                        hintText: 'Enter Firstname',
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 16),
                    Flexible(
                      child: CustomTextField(
                        labelText: 'Lastname',
                        hintText: 'Enter Lastname',
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'Enter email',
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
                Button(label: 'Register', onPressed: () {}),
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
