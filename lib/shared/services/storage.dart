import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage? pref;
  static Storage? _instance;
  factory Storage() {
    _instance ??= Storage._internalConstructor();
    return _instance!;
  }
  Storage._internalConstructor();

  Future<SharedPreferences> _getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<int> setSignin(String email, String token) async {
    SharedPreferences pref = await _getSharedPreferences();

    pref.setString('email', email);
    pref.setString('token', token);
    return 1;
  }

  Future<int> get signout async {
    SharedPreferences pref = await _getSharedPreferences();
    await FirebaseAuth.instance.signOut();
    pref.clear();
    return 1;
  }

  Future<String> get email async {
    SharedPreferences pref = await _getSharedPreferences();
    String email = pref.getString('email') ?? '';
    return email;
  }
}
