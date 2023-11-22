import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../commons/color_common.dart';

class Button_Back extends StatelessWidget {
  const Button_Back({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          color: ColorApp().color_white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: ColorApp().color_black, // Border color
            width: 1.0, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 5),
            )
          ]),
      child: Center(
        child: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: ColorApp().color_green,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
