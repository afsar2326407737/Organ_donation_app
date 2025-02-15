import 'package:flutter/material.dart';
import 'package:organ_don_frontend/Screens/donor_side_view.dart';
import 'package:organ_don_frontend/Screens/home_page.dart';
import 'package:organ_don_frontend/Screens/hospital_dastboard.dart';
import 'package:organ_don_frontend/Screens/login.dart';
import 'package:organ_don_frontend/Screens/message_page.dart';
import 'package:organ_don_frontend/Screens/reciver_side.dart';
import 'package:organ_don_frontend/Screens/signup.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/':(BuildContext context) => const HomePage(),
        '/signup': (BuildContext context) => const HospitalSignup(),
        '/login':(BuildContext context ) => const Login(),
        '/donarside' : (BuildContext context) => const DonorSidePage(),
        '/reciverside':(BuildContext context) => const DonorList(),
        '/hospitaldashboard':(BuildContext context) => const HospitalDash(),
        '/chatpage':(BuildContext context) =>const MessagePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
