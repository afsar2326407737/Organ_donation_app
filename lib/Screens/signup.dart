
// for mongo db url parse
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// packages
import 'package:flutter/material.dart';
import 'package:organ_don_frontend/Loading/loading.dart';
import 'package:organ_don_frontend/Screens/login.dart';
import 'package:organ_don_frontend/Url/urls.dart';


class HospitalSignup extends StatefulWidget {
  const HospitalSignup({super.key});
  @override
  State<HospitalSignup> createState() => _HospitalSignupState();
}

class _HospitalSignupState extends State<HospitalSignup> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  List<String>  dropDownvalue = [ 'Hospital' , 'Donor' , 'Reciver'];
  String? selectedValue;
  final _url = URL_SIGNUP;

  // snak bar data
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

// signup send the data
  Future <void> signup() async{
    final url = Uri.parse(_url);
    final response = await http.post(
      url,
      headers: {'Content-Type' : 'application/json'},
      body:jsonEncode({
        
        'name':_nameController.text,
        'email':_emailController.text,
        'password':_passwordController.text,
        'cpassword': _confirmPasswordController.text,
        // drop down list
        'selectedValue' : selectedValue
      }),
    );
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Loading()
        )
    );
    if (response.statusCode == 200 ){
      if ( selectedValue == 'Donor'){
        Future.delayed(Duration(seconds: 3),(){
          Navigator.pushNamed(context, '/donarside');
        }
        );
      }
      else if (selectedValue == 'Hospital'){
        Future.delayed(Duration(seconds: 3),(){
          Navigator.pushNamed(context, '/hospitaldashboard');
        }
        );
      }
      else if (selectedValue == 'Reciver'){
        Future.delayed(Duration(seconds: 3),(){
          Navigator.pushNamed(context, '/reciverside');
        });
      }
      else {
        _showSnackBar("please select any directory ");
      }
      print('Data Sent Succesfully ');
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      setState(() {
        selectedValue = null;
      });
    }
    else {
      print('Unsuccess  :( ');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.logout))
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'name',
              ),
            ),
            SizedBox(height: 20,),
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
            SizedBox(height: 20,),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity, // Set the width as desired
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedValue,
                  hint: Text('Select an option'
                  ),
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                  items: dropDownvalue.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: signup,
              child: Text('Sign Up'),
            ),
            SizedBox(height: 20,),
            Text("Already registered your hospitial"),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> Login()));
            }, child: Text("Login"))
          ],
        ),
      ),
    );
    }
}
