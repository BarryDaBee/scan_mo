import 'package:azlistview/azlistview.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class Contact extends ISuspensionBean {
  final String? displayName;
  final String? givenName;
  final List<Item>? phoneNumber;
  final Image? userAvatar;
  final String? email;
  final String? tagIndex;

  Contact(
      {this.tagIndex,
      this.displayName,
      this.givenName,
      this.userAvatar,
      this.email,
      this.phoneNumber});

  @override
  String getSuspensionTag() => tagIndex!;
}
