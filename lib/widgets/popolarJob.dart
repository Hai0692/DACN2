import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Popular_Job extends StatelessWidget {
  final String position;
  final String company;
  final String level;
  final String skill;
  final String type;
  final String salary;
  final String avatar;
  final String location;
  final VoidCallback onPress;
  const Popular_Job({
    super.key,
    required this.position,
    required this.company,
    required this.level,
    required this.skill,
    required this.type,
    required this.salary,
    required this.avatar,
    required this.onPress,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 250,
        // height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              HexColor("#6BCB7A"),
              HexColor("#6BCB7A").withAlpha(80),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17, left: 10),
              child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    fit: BoxFit.contain,
                    width: 40,
                    height: 40,
                    avatar,
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          position,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          company,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.heart,
                        color: HexColor("#F54209"),
                        size: 15,
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                      }),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.clock,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      IntrinsicWidth(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              type,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.layerGroup,
                        color: Colors.white,
                        size: 19,
                      ),
                      const SizedBox(width: 10),
                      IntrinsicWidth(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              skill,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.paperclip,
                        color: Colors.white,
                        size: 21,
                      ),
                      const SizedBox(width: 10),
                      IntrinsicWidth(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              level,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, bottom: 20, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "\$ $salary ",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.locationDot,
                        color: Colors.black,
                        size: 15,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        location,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
