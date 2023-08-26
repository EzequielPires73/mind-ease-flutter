import 'package:flutter/material.dart';
import 'package:new_app/controllers/auth_controller.dart';
import 'package:new_app/screens/app.dart';
import 'package:new_app/screens/home.dart';
import 'package:new_app/screens/login.dart';
import 'package:new_app/screens/splash.dart';
import 'package:new_app/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
      ],
      child: MaterialApp(
        title: 'MindEase',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorSchemeSeed: ColorPalette.primary, useMaterial3: true),
        //home: const Login(),
        initialRoute: '/',
        routes: {
          '/': (context) => const Splash(),
          '/home': (context) => const App(),
          '/login': (context) => const Login(),
        },
      ),
    ),
  );
}
