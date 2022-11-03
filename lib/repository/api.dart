// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

abstract class ApiRepository {

  static const BASE = 'http://www.coopertransc.com.br/api_v1/public/api/';

  static const LOGIN = '${BASE}login';

  static const TURN = '${BASE}vez';

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      return token;
    } else {
      return '';
    }
  }

  static void setToken(token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}
