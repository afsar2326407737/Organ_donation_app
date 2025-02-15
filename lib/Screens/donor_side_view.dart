import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:organ_don_frontend/Loading/loading.dart';
import 'package:organ_don_frontend/Url/urls.dart';


class DonorSidePage extends StatefulWidget {
  const DonorSidePage({Key? key}) : super(key: key);

  @override
  _DonorSidePageState createState() => _DonorSidePageState();
}

class _DonorSidePageState extends State<DonorSidePage> {
  // urls for the databases
  final _UrlToGetDonarData = URL_DONOR_DATA;
  final _UrlConnectionHoapitals = URL_HOSPITAL_FETCH;

  // list for fetch the data in the database
  List<dynamic> hospitals = [];



  // functions to fetch and display the data to the drop down list in the fornt end
  Future<void> fetchHospitals() async {
    final response = await http.get(Uri.parse(_UrlConnectionHoapitals));
    if (response.statusCode == 200) {
      setState(() {
        hospitals = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load Hospitals');
    }
  }

  // controllers to send the data to the backend data base
  TextEditingController _username = TextEditingController();
  TextEditingController _bloodgroup = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _donationOrganname  = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _location = TextEditingController();

  // radio button selecting the controller
  String? selectedGender;

  // snak bar
  void _snakBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
        backgroundColor: Colors.red,
      )
    );
  }

  // controller for selecting the hospitals
  String? selectedHospital;
  String? selectedhospitalemail;
  // send the donar data to the backend maongo db

  Future<void> send_donar_data() async {
    if (selectedHospital == null) {
      _snakBar("Please select a hospital");
      return;
    }
    final selectedHospitalObject = hospitals.firstWhere((hospital) => hospital['email'] == selectedHospital);
    final selectedHospitalName = selectedHospitalObject['name'];
    String selectvalue = selectedHospitalName;
    final url = Uri.parse(_UrlToGetDonarData);
    final response_org = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "username": _username.text,
        "gender": selectedGender,
        "bloodgroup": _bloodgroup.text,
        "age": _age.text,
        "donationorgan": _donationOrganname.text,
        "phone": _phone.text,
        "date": _date.text,
        "location": _location.text,
        "hospitalname" : selectvalue,
        "hospitalemail": selectedHospital,
      }),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Loading()),
    );

    if (response_org.statusCode == 200) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushNamed(context, '/reciverside');
      });
    } else {
      _snakBar("Unable to send the data, please check the credentials");
    }
  }

  // state to maintain to shown the fetched hospitals in the drop doewn list
  @override
  void initState() {
    super.initState();
    fetchHospitals();
  }

  // date pop up window
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(() {
        _date.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor Side'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _username,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Gender:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              RadioListTile<String>(
                title: Text('Male'),
                value: 'Male',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Female'),
                value: 'Female',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Other'),
                value: 'Other',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              TextField(
                controller: _bloodgroup,
                decoration: InputDecoration(
                  labelText: 'Blood Group',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _age,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _donationOrganname,
                decoration: InputDecoration(
                  labelText: 'Donating Organ Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _phone,
                decoration: InputDecoration(
                  labelText: "Phone number",
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              MouseRegion(
                cursor: SystemMouseCursors.text,
                child: TextField(
                  controller: _date,
                  decoration: InputDecoration(
                    labelText: "Deadline Date of Organ",
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  readOnly: true,
                  onTap: _selectDate,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _location,
                decoration: InputDecoration(
                  labelText: 'Location',
                  hintText: 'Location',
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
              Container(
                width: 325.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0)
                ),
                child: DropdownButton<String>(
                  hint: Text('Select a hospital'),
                  value: selectedHospital,
                  items: hospitals.map((hospital) {
                    return DropdownMenuItem<String>(
                      value: hospital['email'],
                      child: Text(hospital['name']),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedHospital = value;
                      String selectedHospitalName = hospitals.firstWhere((hospital) => hospital['email'] == selectedHospital)['name'];
                      print(selectedHospitalName);
                    });
                  },
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  send_donar_data();
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
