import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          top: -26,
          left: 230,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: HexColor("#D5EFD8").withAlpha(150),
            ),
          )),
      Positioned(
          top: 126,
          left: 12,
          child: Container(
            width: 155,
            height: 155,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: HexColor("#6DD031").withAlpha(70),
            ),
          )),
      Positioned(
          top: 510,
          left: 285,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: HexColor("#3EA248").withAlpha(70),
            ),
          )),
      Positioned(
          top: 472,
          left: -52,
          child: Container(
            width: 155,
            height: 155,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: HexColor("#6DD031").withAlpha(50),
            ),
          )),
      Positioned(
          top: 643,
          left: 242,
          child: Container(
            width: 194,
            height: 194,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: HexColor("#3EA248").withAlpha(40),
            ),
          )),
    ]);
  }
}
