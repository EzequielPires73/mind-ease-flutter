import 'package:flutter/material.dart';
import 'package:new_app/screens/app.dart';
import 'package:new_app/screens/home.dart';
import 'package:new_app/screens/sign_up.dart';
import 'package:new_app/utils/colors.dart';
import 'package:new_app/widgets/buttons/button_primary.dart';
import 'package:new_app/widgets/inputs/text_field_primary.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 290,
                  color: ColorPalette.bg_dark,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo.png', width: 86),
                      const SizedBox(height: 32),
                      Text(
                        'Bem-vindo ao MindEase',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(Colors.white.value),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Faça login para começar sua jornada de tranquilidade e bem-estar',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(Colors.grey.shade400.value),
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: -100,
                    right: 0,
                    child: Transform.rotate(
                      angle: 45 * 0.0174533,
                      child: Container(
                        width: 60,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )),
                Positioned(
                    top: -130,
                    left: 20,
                    child: Transform.rotate(
                      angle: -45 * 0.0174533,
                      child: Container(
                        width: 60,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )),
                Positioned(
                    bottom: -30,
                    left: -30,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(30)),
                    )),
                Positioned(
                    bottom: 20,
                    right: -20,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(30)),
                    )),
              ],
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                width: 500,
                child: Column(children: [
                  TextFieldPrimary(controller: emailController, label: 'Email'),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldPrimary(controller: passwordController, label: 'Senha', obscureText: true,),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: Text('Esqueceu sua senha?')),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ButtonPrimary(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const App())), title: 'Entrar'),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Não tem uma conta?'),
                      SizedBox(width: 8,),
                      TextButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp())), child: Text('Cadastrar'))
                    ],
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
