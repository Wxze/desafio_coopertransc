import 'dart:convert';
import 'package:desafio_coopertransc/models/user.dart';
import 'package:http/http.dart';
import 'api.dart';

class LoginRepository {
  Future<User?> login(String username, String password) async {
    Map body = {'username': username, 'password': password};

    var resp = await post(Uri.parse(ApiRepository.LOGIN),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
        },
        body: json.encode(body));

    User? user;
    if (resp.statusCode == 200 || resp.statusCode == 201) {
      final data = await json.decode(resp.body.toString());
      user = User.fromJson(data);
    }

    return user;
  }
}
