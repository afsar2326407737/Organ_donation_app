import 'dart:async';
import 'package:flutter/material.dart';
import 'package:organ_don_frontend/Components/app_drawer.dart';
import 'package:organ_don_frontend/Controller/donor_controller.dart';
import 'package:organ_don_frontend/Models/donor_models.dart';
import 'package:organ_don_frontend/config/colors_global.dart';

class DonorList extends StatefulWidget {
  const DonorList({super.key});

  @override
  State<DonorList> createState() => _DonorListState();
}

class _DonorListState extends State<DonorList> {
  late Future<List<Donor>> futureDonors;

  @override
  void initState() {
    super.initState();
    futureDonors = fetchDonors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Available Donors',
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
              colors: [
                Colors.teal,
                Color.fromARGB(255, 3, 196, 177),
                Color.fromARGB(255, 4, 255, 230)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 8,
      ),
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      body: Center(
        child: FutureBuilder<List<Donor>>(
          future: futureDonors,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Donor> donor = snapshot.data!;
              return ListView.builder(
                  itemCount: donor.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.local_hospital,
                                  color: Colors.teal,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  donor[index].hospitalname,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color(0xFF4CAF50),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  color: Colors.teal,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Donor Name : ",
                                  style: TextStyle(
                                    fontFamily: 'Robot',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  donor[index].username,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons
                                      .male, // Change to gender-specific icon if needed
                                  color: Colors.teal,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Gender :",
                                  style: TextStyle(
                                    fontFamily: 'Robot',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  donor[index].gender,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.bloodtype,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Blood Group :",
                                  style: TextStyle(
                                    fontFamily: 'Robot',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  donor[index].bloodgroup,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  color: Colors.teal,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Age :",
                                  style: TextStyle(
                                    fontFamily: 'Robot',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  donor[index].age,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.health_and_safety,
                                  color: Colors.teal,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Organ :",
                                  style: TextStyle(
                                    fontFamily: 'Robot',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  donor[index].donationorgan,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                  color: Colors.teal,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Phone :",
                                  style: TextStyle(
                                    fontFamily: 'Robot',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  donor[index].phone,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.teal,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Location :",
                                  style: TextStyle(
                                    fontFamily: 'Robot',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  donor[index].location,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.date_range,
                                  color: Colors.teal,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Date :",
                                  style: TextStyle(
                                    fontFamily: 'Robot',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  donor[index].date,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/chatpage',
                                  );
                                },
                                icon: const Icon(
                                  Icons.phone,
                                  size: 18,
                                  color: white,
                                ),
                                label: const Text(
                                  'Contact Hospital',
                                  style: TextStyle(color: white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: teal,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10),
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
