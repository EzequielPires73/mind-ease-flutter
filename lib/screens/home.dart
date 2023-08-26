import 'package:flutter/material.dart';
import 'package:new_app/controllers/auth_controller.dart';
import 'package:new_app/models/data.dart';
import 'package:new_app/utils/colors.dart';
import 'package:new_app/widgets/cards/card_subcategory.dart';
import 'package:new_app/widgets/headers/default.dart';
import 'package:new_app/widgets/swipers/categories.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final AuthController controller;

  void _authListener() {
    if (controller.userState == UserState.error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Ocorreu um erro.')));
    } else if (controller.userState == UserState.loggedOut) {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  void initState() {
    super.initState();
    controller = context.read<AuthController>();
    controller.addListener(_authListener);
  }

  @override
  void dispose() {
    controller.removeListener(_authListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        const Header(),
        Container(
            transform: Matrix4.translationValues(0, -16, 0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                SwiperCategories(index: 0),
                SizedBox(
                  height: 24,
                ),
                SwiperCategories(index: 1),
                SizedBox(
                  height: 24,
                ),
                SwiperCategories(index: 2),
                SizedBox(
                  height: 24,
                ),
                SwiperCategories(index: 3),
              ],
            )),
      ]),
    ));
  }
}
