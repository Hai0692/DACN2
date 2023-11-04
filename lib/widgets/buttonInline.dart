import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commons/color_common.dart';

class ButtonInline extends StatefulWidget {
  final String text;
  final VoidCallback onPress;
  final double size;
  const ButtonInline(
      {super.key,
      required this.text,
      required this.onPress,
      required this.size});

  @override
  State<ButtonInline> createState() => _ButtonInlineState();
}

class _ButtonInlineState extends State<ButtonInline> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPress,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(ColorApp().color_green),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Adjust the radius as needed
          ),
        ),
      ),
      child: SizedBox(
        height: 60,
        width: widget.size,
        child: Center(
          child: Text(
            widget.text,
            style: GoogleFonts.poppins(
              color: ColorApp().color_white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
