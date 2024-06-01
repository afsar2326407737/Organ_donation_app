import 'package:flutter/material.dart';

class ReciverSide extends StatefulWidget {
  const ReciverSide({super.key});

  @override
  State<ReciverSide> createState() => _ReciverSideState();
}

class _ReciverSideState extends State<ReciverSide> {
  Future<List<String>> _fetchItems() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Simulate fetching data from a backend
    return List<String>.generate(20, (i) => "Fetched Item $i");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic List'),
      ),
      body: FutureBuilder<List<String>>(
        future: _fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final items = snapshot.data ?? [];
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
