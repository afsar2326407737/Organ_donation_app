import 'package:flutter/material.dart';

class HospitalDash extends StatefulWidget {
  const HospitalDash({super.key});

  @override
  State<HospitalDash> createState() => _HospitalDashState();
}

class _HospitalDashState extends State<HospitalDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Dash Board'),
      ),
      body: Column(
        children: [
          Text('Hospital Dash Board : )')
        ],
      ),
    );;
  }
}

