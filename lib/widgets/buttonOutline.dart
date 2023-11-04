import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commons/color_common.dart';

class ButtonOutline extends StatefulWidget {
  final String text;
  final VoidCallback onPress;
  const ButtonOutline({super.key, required this.text, required this.onPress});

  @override
  State<ButtonOutline> createState() => _ButtonOutlineState();
}

class _ButtonOutlineState extends State<ButtonOutline> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.onPress,
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: ColorApp().color_green,
            width: 1.5,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Adjust the radius as needed
          ),
        ),
      ),
      child: SizedBox(
        height: 60,
        width: 250,
        child: Center(
          child: Text(
            widget.text,
            style: GoogleFonts.poppins(
              color: ColorApp().color_green,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
    ;
  }
}
