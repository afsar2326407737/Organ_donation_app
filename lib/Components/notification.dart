import 'package:flutter/material.dart';

void showCustomSnackBar(
  BuildContext context,String message
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Row(
        children: [
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Message Sent Successfully',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 14, 171, 155),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
