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

  Future getContacts() async {
    setBusy(true);

    Iterable<contact.Contact> rawContacts = await contactsService.getContacts();

    rawContacts.forEach((element) {
      contacts!.add(
        Contact(
          displayName:
              element.displayName ?? element.phones!.toList().first.toString(),
          phoneNumber: element.phones!.toList(),
          tagIndex: element.displayName![0],
        ),
      );
    });
    contacts!.sort((a, b) =>
        a.displayName!.toLowerCase().compareTo(b.displayName!.toLowerCase()));

    setBusy(false);
    notifyListeners();
  }
}
