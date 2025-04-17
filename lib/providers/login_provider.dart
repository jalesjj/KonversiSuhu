import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final String _userEmail = "jales@gmail.com";
  final String _userPassword = "123";

  String _notif = "";

  String get notif => _notif;

  bool login(String email, String password) {
    if (email == _userEmail && password == _userPassword) {
      _notif = "";
      notifyListeners();
      return true;
    } else {
      _notif = "Email atau password salah";
      notifyListeners();
      return false;
    }
  }
}
