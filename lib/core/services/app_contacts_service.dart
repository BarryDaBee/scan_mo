import 'dart:convert';

import 'package:contacts_service/contacts_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../exports.dart';

class AppContactsService {
  Future<Iterable<Contact>> getContacts() {
    return ContactsService.getContacts()..then((print));
  }

  saveJsonAsContact(String userJson) {
    var userData = jsonDecode(userJson);
    try {
      if (userData['name'] == null || userData['phoneNumber'] == null) {
        Fluttertoast.showToast(
            msg: 'Not a valid toast',
            textColor: Colors.white,
            backgroundColor: AppColors.secondary);
      } else {
        ContactsService.addContact(
          Contact(
            displayName: userData['name'],
            phones: [
              Item(label: 'mobile'),
            ],
          ),
        );
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'An unknown error occured: ${e}');
    }
    // try {
    //   jsonDecode(userJson);
    //   ContactsService.addContact(Contact(
    //     displayName: userJson['name'];
    //   ));
    // } catch (e) {
    //   Fluttertoast.showToast(msg: 'An unknown error occured: ${e}');
    // }
  }
}
