import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:new_app/utils/colors.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        InkWell(
          onTap: () { 
            setState(() {
              show = !show;
            });
          },
          highlightColor: ColorPalette.primary.withOpacity(.2),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Dormir melhor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: show ? ColorPalette.primary : Colors.black87),),
              Icon(show ? FeatherIcons.chevronUp : FeatherIcons.chevronDown, color: show ? ColorPalette.primary : Colors.black87,)
            ]),
          ),
        ),
        show ? Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 24),
          decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: ColorPalette.bg_input))),
          child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Item favoritado', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: Colors.red.shade200
                    ),
                    child: IconButton(onPressed: () {}, icon: const Icon(FeatherIcons.heart, color: Colors.white, size: 16,)),
                  )
                ],
              )
          ]),
        ) : Container()
      ]),
    );
  }
}