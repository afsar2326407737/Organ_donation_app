import 'package:flutter/material.dart';
import 'package:organ_don_frontend/Components/app_drawer.dart';
import 'package:organ_don_frontend/config/colors_global.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: background_color,
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Organ Donation',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.tealAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 8,
      ),
      //drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            const Text("Welcome to the Donation App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/reciverside');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Background color
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                ),
              ),
              child: const Text(
                'Recive',
                style: TextStyle(color: white),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text("For donate or  connect",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  "Connect",
                  style: TextStyle(color: white),
                )),
          ],
        ),
      ),
    );
  }
}
