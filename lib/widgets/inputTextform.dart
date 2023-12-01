import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../commons/color_common.dart';

class InputTextform extends StatefulWidget {
  final String text;
  final FaIcon icon;
  final TextEditingController controller;
  const InputTextform(
      {super.key,
      required this.text,
      required this.icon,
      required this.controller});

  @override
  State<InputTextform> createState() => _InputTextformState();
}

class _InputTextformState extends State<InputTextform> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        decoration: BoxDecoration(
            border: Border.all(color: HexColor("#E7E3E3"), width: 0.5),
            borderRadius: BorderRadius.circular(10),
            color: ColorApp().color_grey_light,
            boxShadow: [
              BoxShadow(
                  color: ColorApp().color_black.withAlpha(20),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 3))
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              icon: widget.icon,
              border: InputBorder.none,
              hintText: widget.text,
              hintStyle: GoogleFonts.poppins(
                color: ColorApp().color_grey,
                fontSize: 16,
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter this files';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
