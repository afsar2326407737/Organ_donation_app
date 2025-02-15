import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:organ_don_frontend/Loading/loading.dart';
import 'package:organ_don_frontend/Url/urls.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  List<dynamic> choise = [];
  String? _chosenitem ;
  final _url = URL_LOGIN;

  Future <void> login() async{
    final url = Uri.parse(_url);
    final response = await http.post(
      url,
      headers: {'Content-Type' : 'application/json'},
      body: jsonEncode({
        'email':_emailController.text,
        'password':_passwordController.text,
      })
    );

    // 201 res status is hospital navigation
    // 200 res status is donar side
    // 202 reciver side
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Loading()
        )
    );
    if ( response.statusCode == 200){
      print('data sent successfully ');

      // storing the login data in the local variable
      Future.delayed(Duration(seconds: 3) , () {
        Navigator.pushNamed(context, '/donarside');
      }
      );
    }
    else if ( response.statusCode == 201 ){
      Future.delayed(Duration(seconds: 3) ,(){
        Navigator.pushNamed(context, '/hospitaldashboard');
      }
      );
    }
    else if (response.statusCode == 202 ){
      Future.delayed(Duration(seconds: 3),(){
        Navigator.pushNamed(context, '/reciverside');
      });
    }
    else {
      print("unable to send the data ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration:const  InputDecoration(
                labelText: 'email'
              ),
            ),
            const SizedBox(height: 20,),
              TextField(
              controller: _passwordController,
              decoration:const InputDecoration(
                labelText: 'password',
              ),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
                onPressed: (){
                  login();

                },
                child:const  Text('Login')
            )
          ],
        ),
      ),
    );
  }
}
