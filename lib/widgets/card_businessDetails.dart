import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../commons/color_common.dart';

class businessDetails extends StatelessWidget {
  final int id;
  final String avatar;
  final String name;
  final String location;
  final String career;
  final int size;
  final String phone;
  final String email;
  final VoidCallback onPress;
  const businessDetails({
    super.key,
    required this.id,
    required this.avatar,
    required this.name,
    required this.location,
    required this.career,
    required this.size,
    required this.phone,
    required this.email,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // height: 170,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: ColorApp().color_black.withAlpha(20),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 3))
          ],
        ),
        child: Column(children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 20),
                // height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      HexColor("#FFFFFF"),
                      HexColor("#7F7F7F").withAlpha(40),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            avatar,
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  const FaIcon(FontAwesomeIcons.locationDot,
                                      size: 15),
                                  const SizedBox(width: 5),
                                  Text(
                                    location,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          )
                        ]),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorApp().color_green.withAlpha(80),
                              border: Border.all(color: Colors.white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.userGroup,
                                size: 15,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                // "50 employees",
                                "$career Employees",
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorApp().color_green.withAlpha(80),
                              border: Border.all(color: Colors.white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.accusoft,
                                size: 15,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "$size years",
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: ColorApp().color_green,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          phone,
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: ColorApp().color_green,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: ColorApp().color_green,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          email,
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: ColorApp().color_green,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
