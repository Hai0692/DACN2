import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/pages/favorite_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../commons/color_common.dart';
import '../pages/HomePage_Screen.dart';
import '../pages/abc.dart';
import '../pages/profile_screen.dart';
import '../pages/seach_screen.dart';

class Custome_Bottom extends StatelessWidget {
  const Custome_Bottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 65,
      decoration: BoxDecoration(
        color: ColorApp().color_green,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorApp().color_white,
                borderRadius: const BorderRadius.all(Radius.circular(100))),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              icon: FaIcon(
                FontAwesomeIcons.house,
                color: ColorApp().color_green,
                size: 20,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoritePage()));
            },
            icon: FaIcon(
              FontAwesomeIcons.solidHeart,
              color: ColorApp().color_white,
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Test()));
            },
            icon: FaIcon(
              FontAwesomeIcons.search,
              color: ColorApp().color_white,
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const profileScreen()));
            },
            icon: FaIcon(
              FontAwesomeIcons.solidUser,
              color: ColorApp().color_white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
