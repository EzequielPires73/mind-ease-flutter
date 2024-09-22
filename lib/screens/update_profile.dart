import 'package:flutter/material.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/buttons/button_primary.dart';
import 'package:mind_ease/widgets/inputs/text_field_primary.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController name =
      TextEditingController(text: 'Ezequiel Pires');
  final TextEditingController phone =
      TextEditingController(text: '(64) 99969-8100');
  final TextEditingController email =
      TextEditingController(text: 'ezequiel.pires082000@gmail.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primary,
        foregroundColor: Colors.white,
        title: const Text('Editar perfil'),
      ),
      backgroundColor: Colors.white,
      bottomSheet: BottomAppBar(
        color: Colors.white,
        child: ButtonPrimary(
          onPressed: () => Navigator.pop(context),
          title: 'Salvar',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              TextFieldPrimary(
                  controller: name, label: 'Como gostaria de ser chamado?'),
              const SizedBox(
                height: 24,
              ),
              TextFieldPrimary(controller: phone, label: 'Telefone'),
              const SizedBox(
                height: 24,
              ),
              TextFieldPrimary(controller: email, label: 'Email'),
            ],
          ),
        ),
      ),
    );
  }
}
