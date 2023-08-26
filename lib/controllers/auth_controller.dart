import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState { idle, success, error, loading }
enum UserState { idle, logged, loggedOut, error }

class AuthController extends ChangeNotifier {
  var state = AuthState.idle;
  var userState = UserState.idle;

  Future<void> login(String email, String password) async {
    state = AuthState.loading;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      final User user = User(
          name: 'Ezequiel Pires',
          email: 'ezequiel.pires082000@gmail.com',
          phone: '(64) 99969-8100',
          password: '12345678');

      if (email != user.email || password != user.password) {
        throw Exception('Dados incorretos.');
      }

      final shared = await SharedPreferences.getInstance();
      await shared.setString('user', jsonEncode(user.toString()));
      state = AuthState.success;
      notifyListeners();
    } catch (error) {
      state = AuthState.error;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      final shared = await SharedPreferences.getInstance();
      await shared.remove('user');
      userState = UserState.loggedOut;
      notifyListeners();
    } catch (error) {
      userState = UserState.error;
      notifyListeners();
    }
  }
}
