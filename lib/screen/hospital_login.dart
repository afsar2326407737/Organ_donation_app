import 'package:flutter/material.dart';

class HospitalLogin extends StatefulWidget {
  const HospitalLogin({Key? key}) : super(key: key);

  @override
  State<HospitalLogin> createState() => _HospitalLoginState();
}

class _HospitalLoginState extends State<HospitalLogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  Future<void> _login() async {
    try {
    //   UserCredential userCredential = await _auth.signInWithEmailAndPassword(
    //     email: _emailController.text,
    //     password: _passwordController.text,
    //   );
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Login successful')),
    //   );
    //   // Navigate to another screen if needed
    // } on FirebaseAuthException catch (e) {
    //   String message = '';
    //   if (e.code == 'user-not-found') {
    //     message = 'No user found for that email.';
    //   } else if (e.code == 'wrong-password') {
    //     message = 'Wrong password provided for that user.';
    //   } else {
    //     message = 'Login failed. Please try again.';
    //   }
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text(message)),
    //   );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
            ElevatedButton(
              onPressed: () {
                // Call function to send login credentials to backend
                _sendLoginCredentials();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
  void _sendLoginCredentials() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Here, you would send the login credentials to your backend server.
    // You can use packages like http or dio to make HTTP requests to your backend.

    // Example:
    // http.post('your_backend_url/login', body: {
    //   'email': email,
    //   'password': password,
    // }).then((response) {
    //   // Handle response from server
    // }).catchError((error) {
    //   // Handle error
    // });
  }
}
