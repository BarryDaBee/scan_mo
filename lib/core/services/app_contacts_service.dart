import 'dart:convert';

import 'package:contacts_service/contacts_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../exports.dart';

class AppContactsService {
  Future<Iterable<Contact>> getContacts() {
    return ContactsService.getContacts()..then((print));
  }

  saveJsonAsContact(String userJson) async {
    var userData = jsonDecode(userJson);
    String? name = userData['name'];
    List? phoneNumbers = userData['phoneNumbers'];
    print(name);
    print(phoneNumbers);
    if (name == null || phoneNumbers == null) {
      Fluttertoast.showToast(
          msg: 'Not a valid toast',
          textColor: Colors.white,
          backgroundColor: AppColors.secondary);
    } else {
      await ContactsService.addContact(
        Contact(
          givenName: 'Scan-mo',
          phones: [
            Item(label: 'mobile', value: phoneNumbers[0]),
          ],
        ),
      );
      Fluttertoast.showToast(msg: '"${name}" has been saved successfully');
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
