import 'dart:convert';
import 'package:desafio_coopertransc/models/trip.dart';
import 'package:http/http.dart';
import 'api.dart';

class TripRepository {
  Future<List<Trip>> trip() async {
    String token = await ApiRepository.getToken();

    var resp = await get(Uri.parse('${ApiRepository.BASE}viagens'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Authorization': 'Bearer $token'
        });

    List<Trip> trips = [];
    if (resp.statusCode == 200) {
      final data = await json.decode(resp.body.toString());

      for (var item in data) {
        trips.add(Trip.fromJson(item));
      }
    } else {
      throw Exception("Não foi possivel se conectar com o servidor");
    }

    return trips;
  }

  Future<List<Trip>> myTrip({String initialDate = '', String finalDate = ''}) async {
    String token = await ApiRepository.getToken();
    String id = await ApiRepository.getUserId();
    Map body = {'data_inicio': initialDate, 'data_fim': finalDate};

    var resp = await post(Uri.parse('${ApiRepository.USER}$id/viagens'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(body));

    List<Trip> trips = [];
    if (resp.statusCode == 200) {
      final data = await json.decode(resp.body.toString());

      for (var item in data) {
        trips.add(Trip.fromJson(item));
      }
    } else {
      throw Exception("Não foi possivel se conectar com o servidor");
    }

    return trips;
  }
}
