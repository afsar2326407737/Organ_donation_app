import 'package:http/http.dart' as http;
import 'package:organ_don_frontend/Models/donor_models.dart';
import 'dart:convert';

import 'package:organ_don_frontend/Url/urls.dart';

Future<List<Donor>> fetchDonors() async{
  final donor_get_data = URL_DONOR_GET;
  final response = await http.get(Uri.parse(donor_get_data));

  if ( response.statusCode == 200 ){
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Donor.fromJson(data)).toList();
  }
  else {
    throw Exception('failed to load the donor');
  }
}