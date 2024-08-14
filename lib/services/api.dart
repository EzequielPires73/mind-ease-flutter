import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = 'https://api.mindease.elevechurch.com.br/';

  Future<Map<String, dynamic>> get(String path) async {
    var response = await http.get(Uri.parse(baseUrl + path));

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> post(String path, Object? data) async {
    var response = await http.post(Uri.parse(baseUrl + path), body: data);

    return json.decode(response.body);
  }
}
