import 'package:firstproject/screen/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/screen/donar_side.dart';
import 'package:flutter/material.dart';

void main() async{
  // print("Fire base is running");
  // WidgetsFlutterBinding.ensureInitialized();print("fire  base run complete");
  // await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     initialRoute: "/donar",
  //     routes: {
  //       "/donar": (BuildContext context) => const DonorSidePage(),
  //     },
  //   );
  // }
// }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}