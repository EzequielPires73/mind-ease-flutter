import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:new_app/models/user.dart';
import 'package:new_app/screens/login.dart';
import 'package:new_app/utils/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = User(
        name: 'Ezequiel Pires',
        email: 'ezequiel.pires082000@gmail.com',
        phone: '(64) 99969-8100');

    return Container(
      width: double.infinity,
      height: 146,
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      decoration: const BoxDecoration(color: ColorPalette.bg_dark),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(56),
                color: ColorPalette.primary,
                border: Border.all(color: ColorPalette.primary_dark, width: 4)),
            child: Text(
              user?.name.substring(0, 1) ?? '',
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Olá, ${user?.name}' ?? '',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Vamos começar sua jornada',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              )
            ],
          ),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white.withOpacity(.1),
                ),
                child: IconButton(
                  icon: const Icon(FeatherIcons.logOut),
                  color: Colors.white,
                  onPressed: () {},
                )),
          ))
        ],
      ),
    );
  }
}
