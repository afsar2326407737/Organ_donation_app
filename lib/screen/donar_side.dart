import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'location_service.dart'; // Import location_service.dart

class DonorSidePage extends StatefulWidget {
  const DonorSidePage({Key? key}) : super(key: key);

  @override
  _DonorSidePageState createState() => _DonorSidePageState();
}

class _DonorSidePageState extends State<DonorSidePage> {
  String? _selectedGender;
  TextEditingController _datecontroller = TextEditingController();
  late TextEditingController _usernameController;
  late TextEditingController _ageController;
  late TextEditingController _organNameController;
  File? _image; // Add variable to store selected image
  String _location = 'Unknown'; // Add variable to store location
  final LocationService _locationService = LocationService(); // Initialize LocationService

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _ageController = TextEditingController();
    _organNameController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _ageController.dispose();
    _organNameController.dispose();
    _datecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor Side'),
        backgroundColor: Colors.green, // Set app bar color to green
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
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  _pickImage();
                },
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
                  controller: _datecontroller,
                  decoration: InputDecoration(
                    labelText: "Dead Line Date of Organ",
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate();
                  },
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
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  _fetchLocation(); // Call method to fetch location
                },
                child: Text('Get Location'),
              ),
              SizedBox(height: 20),
              Text(
                'Location: $_location', // Display fetched location
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  _submitForm(); // Call function to submit form
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

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(() {
        _datecontroller.text = _picked.toString().split(" ")[0];
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

  Future<void> _getLocation() async {
    String location = await _locationService.getLocation();
    setState(() {
      _location = location;
    });
  }

  void _submitForm() {
    print('Submitting form...');
    print('Username: ${_usernameController.text}');
    print('Age: ${_ageController.text}');
    print('Organ Name: ${_organNameController.text}');
    print('Phone number: ${_location}');
    print('Date: ${_datecontroller.text}');
    print('Gender: ${_selectedGender}');
  }
}
