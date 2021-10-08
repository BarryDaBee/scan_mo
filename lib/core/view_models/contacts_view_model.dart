import 'package:contacts_service/contacts_service.dart' as contact;
import 'package:scan_mo/core/models/contact.dart';
import 'package:scan_mo/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:scan_mo/core/services/permission_service.dart';
import 'package:scan_mo/core/services/app_contacts_service.dart';

class ContactsViewModel extends BaseViewModel {
  final permissionService = locator<PermissionService>();
  final contactsService = locator<AppContactsService>();

  List<Contact>? contacts = [];

  void getContacts() async {
    setBusy(true);
    //await permissionService.getContactsPermission();
    Iterable<contact.Contact> rawContacts = await contactsService.getContacts();

    rawContacts.forEach((element) {
      print(element);
      contacts!.add(
        Contact(
          displayName:
              element.displayName ?? element.phones!.toList().first.toString(),
          givenName: element.givenName ?? 'hhh',
          phoneNumber: element.phones!.toList(),
          tagIndex: element.displayName![0],
        ),
      );
    });
    contacts!.forEach((element) {
      print(element.givenName);
    });
    contacts!.sort((a, b) =>
        a.displayName!.toLowerCase().compareTo(b.displayName!.toLowerCase()));

    setBusy(false);
    notifyListeners();
  }
}
