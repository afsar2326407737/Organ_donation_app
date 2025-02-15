import 'package:flutter/material.dart';
import 'package:organ_don_frontend/config/colors_global.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, // White background
        child: Column(
          children: [
            // Drawer Header with Welcome Message
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.tealAccent,
              ),
              child: Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    color: black, // White text for the header
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Home Tile
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text('Home', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.message_outlined, color: Colors.black),
              title:
                  const Text('Message', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/chatpage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.black),
              title:
                  const Text('About Us', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/chatpage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title:
                  const Text('Logout', style: TextStyle(color: Colors.black)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout Sccesfully')),
                );
                Navigator.pushNamed(context, '/');
              },
            ),

            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'App Version 1.0',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
