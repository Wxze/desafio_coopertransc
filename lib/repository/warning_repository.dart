import 'dart:convert';
import 'package:http/http.dart';
import '../models/warning.dart';
import 'api.dart';

class WarningRepository {
  Future<List<Warning>> getWarningList() async {
    String token = await ApiRepository.getToken();

    try {
      var resp =
          await get(Uri.parse(ApiRepository.WARNING), headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Authorization': 'Bearer $token'
      });

      List<Warning> warnings = [];
      if (resp.statusCode == 200) {
        final data = await json.decode(resp.body.toString());

        for (var item in data) {
          warnings.add(Warning.fromJson(item));
        }
      }

      return warnings;
    } catch (erro) {
      return [];
    }
  }
}
