import 'dart:math';

import 'package:firstproject/reusable_widget/reusable_widget.dart';
import 'package:firstproject/screen/signup_page.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20 , 0),
          child: Column(
            children: <Widget>[
              logoWidget("assets/images/flutterprologo-removebg-preview.png"),
              SizedBox(
                height: 30,
              ),
              reusableTextField("Enter the user name" , Icons.person_outline,false,
                  _emailTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter the passWord", Icons.lock_outline, true,
                  _passwordTextController),
              SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, true, (){}),
              signUpOption(),
              SizedBox(
                height: 60,
              ),

            ],
          ),
        ),
      ),
    ),
    );
  }
  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an Account ?",
        style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
              "Sign Up",
          style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
