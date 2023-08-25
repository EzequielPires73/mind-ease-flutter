import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:new_app/screens/about.dart';
import 'package:new_app/screens/downloads.dart';
import 'package:new_app/utils/colors.dart';
import 'package:new_app/widgets/headers/default.dart';
import 'package:new_app/widgets/headers/profile.dart';
import 'package:new_app/widgets/pickers/time_picker.dart';
import 'package:new_app/widgets/typografy/title.dart';

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
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const HeaderProfile(),
                Container(
                    width: double.infinity,
                    transform: Matrix4.translationValues(0, -16, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextTitle(value: 'Meus dados'),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black87),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black87),
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
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black87),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(FeatherIcons.clock,
                                          size: 24,
                                          color: ColorPalette.primary),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        'Hora do lembrete',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '12:00',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(FeatherIcons.chevronRight,
                                          size: 24,
                                          color: ColorPalette.primary),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Divider(color: ColorPalette.bg_input),
                            const SizedBox(height: 8),
                            const TextTitle(value: 'Downloads'),
                            const SizedBox(height: 16),
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Downloads())),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(FeatherIcons.download,
                                          size: 24,
                                          color: ColorPalette.primary),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        'Meus downloads',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                  Icon(FeatherIcons.chevronRight,
                                      size: 24, color: ColorPalette.primary),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Divider(color: ColorPalette.bg_input),
                            const SizedBox(height: 8),
                            const TextTitle(value: 'Sobre nós'),
                            const SizedBox(height: 16),
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const About())),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(FeatherIcons.book,
                                          size: 24,
                                          color: ColorPalette.primary),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        'Nossa essência',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                  Icon(FeatherIcons.chevronRight,
                                      size: 24, color: ColorPalette.primary),
                                ],
                              ),
                            )
                          ]),
                    )),
              ],
            )),
      ),
    );
  }
}
