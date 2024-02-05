import 'package:flutter/material.dart';
import 'package:mind_ease/controllers/auth_controller.dart';
import 'package:mind_ease/controllers/category_controller.dart';
import 'package:mind_ease/screens/app.dart';
import 'package:mind_ease/screens/home.dart';
import 'package:mind_ease/screens/login.dart';
import 'package:mind_ease/screens/splash.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryController(),
        )
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
