import 'package:flutter/material.dart';
import 'package:firstproject/screen/hospital_login.dart';

class HospitalSignup extends StatefulWidget {
  const HospitalSignup({super.key});

  @override
  State<HospitalSignup> createState() => _HospitalSignupState();
}

class _HospitalSignupState extends State<HospitalSignup> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _saveUserCredentials() async {
    if (_passwordController.text == _confirmPasswordController.text) {
      // //SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('email', _emailController.text);
      // await prefs.setString('password', _passwordController.text);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('User credentials saved successfully')),
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveUserCredentials,
              child: Text('Sign Up'),
            ),
            SizedBox(height: 20,),
            Text("Already registered your hospitial"),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> HospitalLogin()));
            }, child: Text("Login"))
          ],
        ),
      ),
    );
    }
}
