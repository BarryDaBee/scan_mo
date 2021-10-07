import 'package:contacts_service/contacts_service.dart';
import 'package:scan_mo/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:scan_mo/core/services/permission_service.dart';
import 'package:scan_mo/core/services/app_contacts_service.dart';

class ContactsViewModel extends BaseViewModel {
  final permissionService = locator<PermissionService>();
  final contactsService = locator<AppContactsService>();

  Iterable<Contact> contacts;

  void getContacts() async {
    setBusy(true);
    permissionService.getContactsPermission();
    contacts = await contactsService.getContacts();
    setBusy(false);
    notifyListeners();
  }
}
