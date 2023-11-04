import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commons/color_common.dart';

class See_All extends StatelessWidget {
  final String name;
    final VoidCallback onPress;
  const See_All({
    required this.name,
    super.key, required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onPress,
          child: Text(
            "See all",
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorApp().color_green),
          ),
        )
      ],
    );
  }
}
