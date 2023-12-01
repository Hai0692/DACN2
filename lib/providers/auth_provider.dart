import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin {
    return _isLogin;
  }

  //when login success, update the status
  void loginSuccess() async {
    _isLogin = true;
    notifyListeners();
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('isLoggedIn', true);
  }
   void logout() {
    _isLogin = false;
    notifyListeners();
  }
}

