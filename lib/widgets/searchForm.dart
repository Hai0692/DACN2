import 'package:flutter/material.dart';

import '../commons/color_common.dart';

class Search_Form extends StatelessWidget {
  const Search_Form({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorApp().color_white,
          boxShadow: [
            BoxShadow(
                color: ColorApp().color_black.withAlpha(20),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 3))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: TextField(
              //  onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "Search here....",
                hintStyle: TextStyle(
                    color: ColorApp().color_grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(5)),
            child: const Image(
              width: 24,
              image: AssetImage("assets/icons/sliders.png"),
            ),
          )
        ]),
      ),
    );
  }
}
