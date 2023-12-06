import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../commons/color_common.dart';

class Top_Company extends StatelessWidget {
  final String company;
  final String location;
  final String career;
  final String avatar;
  final VoidCallback onPress;
  const Top_Company({
    super.key,
    required this.company,
    required this.location,
    required this.career,
    required this.avatar,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 70,
        width: 330,
        decoration: BoxDecoration(
            color: ColorApp().color_white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: ColorApp().color_black.withAlpha(20),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(0, 3))
            ]),
        child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              fit: BoxFit.contain,
              width: 40,
              height: 40,
              avatar,
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    location,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: ColorApp().color_black.withAlpha(20),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3))
                  ],
                  color: HexColor("#D5D5D5"),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "$career staff",
                  style: GoogleFonts.poppins(
                    color: ColorApp().color_black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
