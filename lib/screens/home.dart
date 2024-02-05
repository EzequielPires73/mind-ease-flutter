import 'package:flutter/material.dart';
import 'package:mind_ease/controllers/auth_controller.dart';
import 'package:mind_ease/controllers/category_controller.dart';
import 'package:mind_ease/models/data.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/cards/card_subcategory.dart';
import 'package:mind_ease/widgets/headers/default.dart';
import 'package:mind_ease/widgets/swipers/categories.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final AuthController controller;
  late final CategoryController categoryController;

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
    categoryController = context.read<CategoryController>();
    controller = context.read<AuthController>();
    controller.addListener(_authListener);

    categoryController.loadCategories();
  }

  @override
  void dispose() {
    controller.removeListener(_authListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Column(children: [
        const Header(),
        Container(
          transform: Matrix4.translationValues(0, -16, 0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Consumer<CategoryController>(
            builder: (context, value, child) {
              return value.categories.isEmpty
                  ? Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: const Text('Carregando'),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: value.categories
                          .asMap()
                          .map((index, e) => MapEntry(
                              index,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 24),
                                  SwiperCategories(category: e, index: index),
                                ],
                              )))
                          .values
                          .toList(),
                    );
            },
          ),
        ),
      ]),
    ));
  }
}



/* 

import 'package:flutter/material.dart';
import 'package:mind_ease/controllers/auth_controller.dart';
import 'package:mind_ease/controllers/category_controller.dart';
import 'package:mind_ease/models/data.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/cards/card_subcategory.dart';
import 'package:mind_ease/widgets/headers/default.dart';
import 'package:mind_ease/widgets/swipers/categories.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final AuthController controller;
  late final CategoryController categoryController;

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
    categoryController = context.read<CategoryController>();
    controller = context.read<AuthController>();
    controller.addListener(_authListener);

    categoryController.loadCategories();
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


 */