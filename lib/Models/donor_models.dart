class Donor{
  final String id ;
  final String username;
  final String gender;
  final String bloodgroup;
  final String age;
  final String donationorgan;
  final String phone;
  final String date;
  final String location;
  final String hospitalname;

  Donor({
    required this.id,
    required this.username,
    required this.gender,
    required this.bloodgroup,
    required this.age,
    required this.donationorgan,
    required this.phone,
    required this.date,
    required this.location,
    required this.hospitalname,
  });

  factory Donor.fromJson(Map<String , dynamic > json){
    return Donor(
        id: json['_id'] ??'',
        username: json['username']??'',
        gender: json['gender']??'',
        bloodgroup: json['bloodgroup']??'',
        age: json['age']??'',
        donationorgan: json['donationorgan']??'',
        phone: json['phone']??'',
        date: json['date']??'',
        location: json['location']??'',
        hospitalname: json['hospitalname']??''
    );
  }
}