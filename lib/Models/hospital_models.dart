import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _hospitalemail = '';
  String get hospitaldonoremail => _hospitalemail;

  void setDonorEmail(String email) {
    _hospitalemail = email;
    notifyListeners();
  }
}