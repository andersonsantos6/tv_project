import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tv_project_beta_01/src/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyDjFiWALH4Z_WMTxpPlSOafvnvsz39qdKw';
    final response = await http.post(Uri.parse(url),
        body: jsonEncode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));

    final body = jsonDecode(response.body);
    if (body['error'] != null) {
      throw AuthException(key: body['error']['message']);
    }
  }

  Future<void> singup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
