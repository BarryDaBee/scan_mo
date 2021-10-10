import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  SharedPreferences? _sharedPrefs;
  bool? get isOldUser => _sharedPrefs?.containsKey('oldUser') ?? false;
  String? get name => _sharedPrefs?.getString('name') ?? '';
  set name(name) => _sharedPrefs?.setString('name', name);

  Future initialize() async {
    _sharedPrefs = await SharedPreferences.getInstance();
    return true;
  }

  void markAsOldUser() async {
    _sharedPrefs?.setBool('oldUser', true);
  }
}
