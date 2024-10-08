import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mind_ease/screens/about.dart';
import 'package:mind_ease/screens/downloads.dart';
import 'package:mind_ease/screens/update_profile.dart';
import 'package:mind_ease/utils/colors.dart';
import 'package:mind_ease/widgets/headers/profile.dart';
import 'package:mind_ease/widgets/pickers/time_picker.dart';
import 'package:mind_ease/widgets/typografy/title.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool alert = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        foregroundColor: Colors.white,
        title: const Text(
          'Meus dados',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UpdateProfile(),
              ),
            ),
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
        backgroundColor: ColorPalette.primary,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 16),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(FeatherIcons.phone,
                      size: 24, color: ColorPalette.primary),
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    '(64) 99969-8100',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: ColorPalette.bg_input),
              const SizedBox(height: 16),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(FeatherIcons.mail,
                      size: 24, color: ColorPalette.primary),
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    'ezequiel.pires@gmail.com',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: ColorPalette.bg_input),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(FeatherIcons.bell,
                          size: 24, color: ColorPalette.primary),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        'Lembrete diário',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )
                    ],
                  ),
                  Switch(
                      value: alert,
                      onChanged: (bool value) {
                        setState(() {
                          alert = value;
                        });
                      })
                ],
              ),
              const SizedBox(height: 4),
              const Divider(color: ColorPalette.bg_input),
              const SizedBox(height: 16),
              const TimePicker(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(FeatherIcons.clock,
                            size: 24, color: ColorPalette.primary),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          'Hora do lembrete',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '12:00',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(FeatherIcons.chevronRight,
                            size: 24, color: ColorPalette.primary),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Divider(color: ColorPalette.bg_input),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const About())),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(FeatherIcons.book,
                            size: 24, color: ColorPalette.primary),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          'Nossa essência',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        )
                      ],
                    ),
                    Icon(FeatherIcons.chevronRight,
                        size: 24, color: ColorPalette.primary),
                  ],
                ),
              )
            ]),
          ),
        ],
      )),
    );
  }
}
