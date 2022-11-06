// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

abstract class ApiRepository {
  static const BASE = 'http://www.coopertransc.com.br/api_v1/public/api/';

  static const LOGIN = '${BASE}login';

  static const TURN = '${BASE}vez';

  static const USER = '${BASE}user/';

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      return token;
    } else {
      return '';
    }
  }

  static void setUserData(token, userId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setString('userId', userId);
  }

  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    if (userId != null) {
      return userId;
    } else {
      return '';
    }
  }
}
