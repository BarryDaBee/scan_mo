import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/services/app_contacts_service.dart';

import 'contacts_view_model.dart';

class SaveContactViewModel extends BaseViewModel {
  AppContactsService _appContactsService = locator<AppContactsService>();
  // refresh() {
  //   notifyListeners();
  // }

  Future<void> saveContact(userJson) async {
    await _appContactsService.saveJsonAsContact(userJson);
    ContactsViewModel contactsModel = locator<ContactsViewModel>();
    contactsModel.getContacts();
  }
}
