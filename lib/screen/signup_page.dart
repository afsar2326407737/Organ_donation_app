import 'package:firstproject/reusable_widget/reusable_widget.dart';
import 'package:firstproject/screen/home.dart';
import 'package:firstproject/utils/color_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userNameTextController= TextEditingController();
  TextEditingController _emailTextController= TextEditingController();
  TextEditingController _passwordTextController= TextEditingController();
  //  void sendMessage(String message){
  //    print(message);
  //    WebSocketChannel channel;
  //    try{
  //      print(message + "-_-");
  //      channel = WebSocketChannel.connect(Uri.parse('ws://localhost:3000'));
  //      channel.stream.listen((message) {
  //        // print(message);
  //        channel.sink.close();
  //      });
  //    }
  //    catch(e){
  //      print(e);
  //    }
  //    _emailTextController.clear();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  hexStringToColor("CB2B93"),
                  hexStringToColor("9546C4"),
                  hexStringToColor("5E61F4")
                ],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
    child: SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.fromLTRB(20, 120, 20 , 0),
    child: Column(
       children: <Widget>[
         const SizedBox(
            height: 20,
        ),
        reusableTextField("Enter User Name", Icons.person_outline, false, _userNameTextController),
        const SizedBox(
          height: 20,
        ),
        reusableTextField("Enter Email", Icons.lock_outline, true,
          _emailTextController),
        const SizedBox(
            height: 20,
        ),
        reusableTextField("Enter Password", Icons.lock_outline, true,
          _passwordTextController),
        const SizedBox(
          height: 20,
        ),
         ElevatedButton(onPressed: (){
           if (_emailTextController.text.isNotEmpty){
             // sendMessage(_emailTextController.text);
           }
         }, child: const Text("Message sent")),
        signInSignUpButton(context, false, (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          })
          ],
          ),
        ))),

    );
  }
}
