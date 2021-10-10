import 'dart:convert';

class User {
  final String? name;
  final String? phoneNumber;

  User({this.name, this.phoneNumber});

  User.fromJson(Map json)
      : name = json['name'],
        phoneNumber = json['phoneNumber'];
  toJson() {
    return jsonEncode({
      'name': this.name,
      'phoneNumber': this.phoneNumber,
    });
  }
}
