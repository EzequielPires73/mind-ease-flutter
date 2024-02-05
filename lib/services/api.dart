import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = 'http://192.168.0.21:8080/';

  Future<Map<String, dynamic>> get(String path) async {
    var response = await http.get(Uri.parse(baseUrl + path));

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> post(String path, Object? data) async {
    var response = await http.post(Uri.parse(baseUrl + path), body: data);

    return json.decode(response.body);
  }
}
