import 'package:flutter/material.dart';

class Contact {
  final String firstname;
  final String lastname;
  final String phoneNumber;
  final Image userAvatar;
  final String email;

  Contact(
      {this.firstname,
      this.lastname,
      this.userAvatar,
      this.email,
      this.phoneNumber});

  Contact.fromJson(Map json)
      : email = json["email"],
        phoneNumber = json['phone'],
        firstname = json['firstname'],
        lastname = json['lastname'],
        userAvatar = json['user-avatar'];
}
