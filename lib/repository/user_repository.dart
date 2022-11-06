import 'dart:convert';
import 'package:desafio_coopertransc/models/user.dart';
import 'package:http/http.dart';
import 'api.dart';

class UserRepository {
  Future<User?> getUser() async {
    String token = await ApiRepository.getToken();

    try {
      String id = await ApiRepository.getUserId();
      var resp = await get(
        Uri.parse('${ApiRepository.USER}$id'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      User? user;
      if (resp.statusCode == 200) {
        final data = await json.decode(resp.body.toString());
        user = User.fromJsonEdit(data);
      }
      return user;
    } catch (erro) {
      return null;
    }
  }
}
