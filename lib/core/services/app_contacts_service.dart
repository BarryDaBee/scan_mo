import 'package:contacts_service/contacts_service.dart';

class AppContactsService {
  Future<Iterable<Contact>> getContacts() {
    return ContactsService.getContacts()..then((print));
  }
}
