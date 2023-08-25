import 'package:flutter/material.dart';
import 'package:new_app/screens/login.dart';
import 'package:new_app/utils/colors.dart';

void main() {
  runApp(MaterialApp(
    title: 'MindEase',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorSchemeSeed: ColorPalette.primary,
      useMaterial3: true
    ),
    home: const Login()
  ));
}