import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  SharedPreferences? _sharedPrefs;
  bool? get isOldUser => _sharedPrefs?.containsKey('oldUser') ?? false;
  String? get name => _sharedPrefs?.getString('name') ?? '';
  String? get primaryPhone => _sharedPrefs?.getString('primaryPhone') ?? '';
  String? get secondaryPhone => _sharedPrefs?.getString('secondaryPhone') ?? '';
  set name(String? name) => _sharedPrefs?.setString('name', name!);
  set primaryPhone(String? primaryPhone) =>
      _sharedPrefs?.setString('primaryPhone', primaryPhone!);

  set secondaryPhone(String? secondaryPhone) =>
      _sharedPrefs?.setString('secondaryPhone', secondaryPhone!);

  Future initialize() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  void markAsOldUser() async {
    _sharedPrefs?.setBool('oldUser', true);
  }
}
