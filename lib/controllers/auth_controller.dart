import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mind_ease/models/user.dart';
import 'package:mind_ease/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState { idle, success, error, loading }

enum UserState { idle, logged, loggedOut, error }

class AuthController extends ChangeNotifier {
  final ApiService api = ApiService();
  late User? user;
  var state = AuthState.idle;
  var userState = UserState.idle;
  String? accessToken;
  var errorMsg = '';

  Future<void> loadUser() async {
    final shared = await SharedPreferences.getInstance();
    final userData = shared.getString('user');
    final accessTokenData = shared.getString('accessToken');
    if (userData != null) {
      user = User.fromJson(json.decode(userData));
      accessToken = accessTokenData;
      userState = UserState.logged;
      notifyListeners();
    } else {
      userState = UserState.loggedOut;
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    state = AuthState.loading;
    notifyListeners();

    try {
      var res =
          await api.post('auth/login', {"email": email, "password": password});

      if (res['statusCode'] == '401' || res['user'] == null) {
        throw Exception('Dados incorretos.');
      }

      final shared = await SharedPreferences.getInstance();
      await shared.setString('user', jsonEncode(res['user']));
      await shared.setString('accessToken', jsonEncode(res['access_token']));
      user = User.fromJson(res['user']);
      accessToken = res['access_token'];
      state = AuthState.success;
      notifyListeners();
    } catch (error) {
      print(error);
      errorMsg = error.toString();
      state = AuthState.error;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      final shared = await SharedPreferences.getInstance();
      await shared.remove('user');
      await shared.remove('accessToken');
      userState = UserState.loggedOut;
      notifyListeners();
    } catch (error) {
      userState = UserState.error;
      notifyListeners();
    }
  }
}
