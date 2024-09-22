import 'package:flutter/material.dart';
import 'package:mind_ease/screens/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}
