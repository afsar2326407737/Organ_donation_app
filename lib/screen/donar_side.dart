import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'location_service.dart';

class DonorSidePage extends StatefulWidget {
  const DonorSidePage({Key? key}) : super(key: key);

  @override
  _DonorSidePageState createState() => _DonorSidePageState();
}

class _DonorSidePageState extends State<DonorSidePage> {
  String? _selectedGender;
  TextEditingController _dateController = TextEditingController();
  late TextEditingController _usernameController;
  late TextEditingController _ageController;
  late TextEditingController _organNameController;
  late TextEditingController _bloodgroup;
  File? _image;
  String _location = 'Unknown';
  final LocationService _locationService = LocationService();

  var items = [
    'Kinathukadavu Hospital',
    'Nivetha Hospital',
    'Ashok Hospital',
    'Apollo Hospital'
  ];
  String? _selectedHospital;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _ageController = TextEditingController();
    _organNameController = TextEditingController();
    _bloodgroup = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _ageController.dispose();
    _organNameController.dispose();
    _dateController.dispose();
    super.dispose();
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
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: Icon(Icons.image),
                label: Text('Select Image'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _ageController,
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
                controller: _organNameController,
                decoration: InputDecoration(
                  labelText: 'Donating Organ Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
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
                  controller: _dateController,
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
              Text(
                'Gender:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              RadioListTile<String>(
                title: Text('Male'),
                value: 'Male',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Female'),
                value: 'Female',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Other'),
                value: 'Other',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchLocation,
                child: Text('Get Location'),
              ),
              SizedBox(height: 20),
              Text(
                'Location: $_location',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Select your Hospital",
                ),
                value: _selectedHospital,
                items: items.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedHospital = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Please select a hospital";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
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

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _fetchLocation() async {
    String location = await _locationService.getLocation();
    setState(() {
      _location = location;
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _submitForm() async {
    // Collect the form data
    print(_usernameController);
    print(_ageController);
    print(_organNameController);
    print(_dateController);
    print(_selectedGender);
    print(_selectedHospital);
    print(_bloodgroup);
    print(_location);
    final formData = {
      'username': _usernameController.text,
      'age': _ageController.text,
      'organName': _organNameController.text,
      'date': _dateController.text,
      'gender': _selectedGender,
      'location': _location,
      'hospital': _selectedHospital,
    };

    // Save the form data to Firestore
    CollectionReference donors = FirebaseFirestore.instance.collection(
        'donors');
    try {
      await donors.add(formData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit form: $e')),
      );
    }
  }
}

