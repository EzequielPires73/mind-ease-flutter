import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:new_app/blocs/users/user_bloc.dart';
import 'package:new_app/blocs/users/user_events.dart';
import 'package:new_app/blocs/users/user_states.dart';
import 'package:new_app/models/user.dart';
import 'package:new_app/screens/login.dart';
import 'package:new_app/utils/colors.dart';
import 'package:new_app/widgets/buttons/button_primary.dart';
import 'package:new_app/widgets/inputs/text_field_primary.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final UserBloc userBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var phoneNumberFormatter = MaskTextInputFormatter(
    mask: "(##) #####-####",
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    super.initState();
    userBloc = UserBloc();
    userBloc.stream.listen(_addListen);
  }

  void _addListen(UserState state) {
    if (state is UserErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(state.message),
        ),
      );
    } else if (state is UserSuccessCreateState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(state.message),
        ),
      );
    } else if (state is UserLoadingState) {
      setState(() {
        isLoading = state.isLoading;
      });
    }
  }

  Future<void> handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      userBloc.inputClient.add(
        AddUserEvent(
          user: User(
            email: emailController.value.text,
            name: nameController.value.text,
            phone: phoneController.value.text,
            password: passwordController.value.text,
          ),
        ),
      );
    }
  }

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
                        'Crie sua conta no MindEase',
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
                        'Comece sua jornada de autodescoberta e equilíbrio',
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
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                  width: 500,
                  child: Column(children: [
                    TextFieldPrimary(
                      controller: nameController,
                      label: 'Nome',
                      required: true,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFieldPrimary(
                      controller: phoneController,
                      label: 'Telefone',
                      required: true,
                      formatter: [phoneNumberFormatter],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
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
                      height: 24,
                    ),
                    ButtonPrimary(
                      onPressed: handleSubmit,
                      title: 'Cadastrar',
                      isLoading: isLoading,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Já tem uma conta?'),
                        const SizedBox(
                          width: 8,
                        ),
                        TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login())),
                            child: const Text('Entrar'))
                      ],
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
