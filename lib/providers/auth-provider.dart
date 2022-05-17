import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/HttpException.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuth {
    print("i was called, ${!(token == null)}");

    return !(token == null);
  }


  String get token {
    if (_token != null &&
        _expiryDate != null &&
        _expiryDate.isAfter(DateTime.now())) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(
      String Email, String Pass, String urlSegment) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyB-Rz5Fy68UWBK5DbVja2kBDceKA0kltG0");
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'email': Email,
          'password': Pass,
          'returnSecureToken': true,
        }),
      );
      if (json.decode(response.body)['error'] != null) {
        throw HttpException(json.decode(response.body)['error']['message']);
      }
      _token = json.decode(response.body)['idToken'];
      _userId = json.decode(response.body)['localId'];
      _expiryDate = DateTime.now().add(
        Duration(seconds: int.parse(json.decode(response.body)['expiresIn'])),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String Email, String Pass) async {
    return _authenticate(Email, Pass, 'signUp');
  }

  Future<void> login(String Email, String Pass) async {
    return _authenticate(Email, Pass, "signInWithPassword");
  }
}
