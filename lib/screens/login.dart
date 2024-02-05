import 'package:flutter/material.dart';
import 'package:mind_ease/controllers/auth_controller.dart';
import 'package:mind_ease/screens/app.dart';
import 'package:mind_ease/screens/home.dart';
import 'package:mind_ease/screens/sign_up.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/buttons/button_primary.dart';
import 'package:mind_ease/widgets/inputs/text_field_primary.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final AuthController controller;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      controller.login(
        emailController.value.text,
        passwordController.value.text,
      );
    }
  }

  void _authListener() {
    if (controller.state == AuthState.error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(controller.errorMsg)));
    } else if (controller.state == AuthState.success) {
      Navigator.of(context).pushReplacementNamed('/home');
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
    final controller = context.watch<AuthController>();
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldPrimary(
                        controller: emailController,
                        label: 'Email',
                        required: true,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFieldPrimary(
                        controller: passwordController,
                        label: 'Senha',
                        obscureText: true,
                        required: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Esqueceu sua senha?'),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Consumer<AuthController>(
                        builder: (context, value, child) => ButtonPrimary(
                          onPressed: handleSubmit,
                          isLoading: controller.state == AuthState.loading,
                          title: 'Entrar',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não tem uma conta?'),
                          const SizedBox(
                            width: 8,
                          ),
                          TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp())),
                              child: const Text('Cadastrar'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
