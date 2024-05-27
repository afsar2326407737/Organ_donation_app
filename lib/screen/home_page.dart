import 'package:firstproject/screen/donar_side.dart';
import 'package:firstproject/screen/signup_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(
          Icons.verified_user,
          color: Colors.white, // Set icon color to white
          size: 60, // Set icon size
        ),
          const SizedBox(width: 5),
            Text("Welcome to the Donation App" ,
              style:TextStyle(
                color: Colors.white,
                fontSize: 24, // Set font size
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DonorSidePage()),
                );
                // Define what happens when the button is pressed
              },
              child: const Text('Donar Side'),
            ),
            const SizedBox(height: 20), // Add some space between the buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
                // Define what happens when the button is pressed
              },
              child: const Text('Recever side'),
            ),
          ],
        ),
      ),
    );
  }
}
