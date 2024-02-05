import 'package:flutter/material.dart';
import 'package:mind_ease/utils/colors.dart';

class ReminderTime extends StatefulWidget {
  const ReminderTime({super.key});

  @override
  State<ReminderTime> createState() => _ReminderTimeState();
}

class _ReminderTimeState extends State<ReminderTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primary,
        foregroundColor: Colors.white,
        title: const Text('Hora do lembrete'),
      ),
    );
  }
}