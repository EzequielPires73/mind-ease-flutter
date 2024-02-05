import 'package:flutter/material.dart';
import 'package:mind_ease/controllers/auth_controller.dart';
import 'package:mind_ease/screens/app.dart';
import 'package:mind_ease/screens/login.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late final AuthController controller;

  void authListene() {
    if(controller.userState == UserState.logged) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const App(),));
    } else if(controller.userState == UserState.loggedOut) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login(),));
    }
  }

  @override
  void initState() {
    super.initState();
    controller = context.read<AuthController>();
    controller.loadUser();
    controller.addListener(authListene);
  }

  @override
  void dispose() {
    controller.removeListener(authListene);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(color: ColorPalette.primary,),
    );
  }
}