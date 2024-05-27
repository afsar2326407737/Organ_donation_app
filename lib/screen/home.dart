
import 'package:firstproject/screen/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("LogOut"),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
          },
        ),
      ),
    );
  }
}