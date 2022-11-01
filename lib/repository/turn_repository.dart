import 'dart:convert';
import 'package:desafio_coopertransc/models/turn.dart';
import 'package:http/http.dart';
import 'api.dart';

class TurnRepository {
  Future<List<Turn>> getTurnList() async {
    String token = await ApiRepository.getToken();

    try {
      var resp =
          await get(Uri.parse(ApiRepository.TURN), headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Authorization': 'Bearer $token'
      });

      List<Turn> turns = [];
      if (resp.statusCode == 200) {
        final data = await json.decode(resp.body.toString());

        for (var item in data) {
          turns.add(Turn.fromJson(item));
        }
      }

      return turns;
    } catch (erro) {
      return [];
    }
  }
}
