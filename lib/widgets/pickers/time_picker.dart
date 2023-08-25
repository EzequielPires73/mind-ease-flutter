import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final Widget content;
  const TimePicker({super.key, required this.content});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late Widget content;

  @override
  void initState() {
    content = widget.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
      },
      child: content,
    );
  }
}