import 'dart:convert';

class User {
  final String? name;
  final List<String>? phoneNumbers;

  User({this.name, this.phoneNumbers});

  User.fromJson(Map json)
      : name = json['name'],
        phoneNumbers = json['phoneNumbers'];
  toJson() {
    return jsonEncode({
      'name': this.name,
      'phoneNumbers': this.phoneNumbers,
    });
  }
}
