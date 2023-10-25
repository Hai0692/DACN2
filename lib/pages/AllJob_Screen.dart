import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../commons/color_common.dart';

class AllJob extends StatefulWidget {
  const AllJob({super.key});

  @override
  State<AllJob> createState() => _AllJobState();
}

class _AllJobState extends State<AllJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Stack(children: [
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
                top: 452,
                left: 269,
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
          ]),
          Positioned(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorApp().color_white,
                        boxShadow: [
                          BoxShadow(
                              color: ColorApp().color_black.withAlpha(20),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 3))
                        ]),
                    child: IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.chevronLeft,
                        color: ColorApp().color_black,
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 330,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorApp().color_white,
                        boxShadow: [
                          BoxShadow(
                              color: ColorApp().color_black.withAlpha(20),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 3))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Image(
                                width: 24,
                                image: AssetImage("assets/icons/sliders.png"),
                              ),
                            )
                          ]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Popular job",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "See all",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ColorApp().color_green),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 30),
                        Container(
                          width: 240,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                HexColor("#7DF260"),
                                HexColor("#AAE69B"),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 17, left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Image(
                                      width: 50,
                                      height: 50,
                                      image:
                                          AssetImage("assets/images/figma.png"),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.poppins(
                                          color: ColorApp().color_black,
                                        ), // Default text style
                                        children: const <TextSpan>[
                                          TextSpan(
                                            text: 'UI UX Designer\n',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Comapy',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Remote",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Junior",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Full Time",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 15),
                                child: Text(
                                  "\$80k-110k/year",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 240,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                HexColor("#7DF260"),
                                HexColor("#AAE69B"),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 17, left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Image(
                                      width: 50,
                                      height: 50,
                                      image:
                                          AssetImage("assets/images/figma.png"),
                                    ),
                                    const SizedBox(width: 10),
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.poppins(
                                          color: ColorApp().color_black,
                                        ), // Default text style
                                        children: const <TextSpan>[
                                          TextSpan(
                                            text: 'UI UX Designer\n',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Comapy',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Remote",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Junior",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Full Time",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 15),
                                child: Text(
                                  "\$80k-110k/year",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 240,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                HexColor("#7DF260"),
                                HexColor("#AAE69B"),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 17, left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Image(
                                      width: 50,
                                      height: 50,
                                      image:
                                          AssetImage("assets/images/figma.png"),
                                    ),
                                    const SizedBox(width: 10),
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.poppins(
                                          color: ColorApp().color_black,
                                        ), // Default text style
                                        children: const <TextSpan>[
                                          TextSpan(
                                            text: 'UI UX Designer\n',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Comapy',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Remote",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Junior",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Full Time",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 15),
                                child: Text(
                                  "\$80k-110k/year",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Recent Job List",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "See all",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ColorApp().color_green),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: ColorApp().color_black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image(
                              image: AssetImage("assets/icons/figma_ic.png")),
                        ),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              color: ColorApp().color_black,
                            ), // Default text style
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'UI UX Designer\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: 'Comapy',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 53,
                          height: 28,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: ColorApp().color_black.withAlpha(20),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(0, 3))
                              ],
                              color: HexColor("#F6F6F6"),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "\$40/h",
                              style: GoogleFonts.poppins(
                                color: ColorApp().color_black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: ColorApp().color_black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image(
                              image: AssetImage("assets/icons/figma_ic.png")),
                        ),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              color: ColorApp().color_black,
                            ), // Default text style
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'UI UX Designer\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: 'Comapy',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 53,
                          height: 28,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: ColorApp().color_black.withAlpha(20),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(0, 3))
                              ],
                              color: HexColor("#F6F6F6"),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "\$40/h",
                              style: GoogleFonts.poppins(
                                color: ColorApp().color_black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: ColorApp().color_black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image(
                              image: AssetImage("assets/icons/figma_ic.png")),
                        ),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              color: ColorApp().color_black,
                            ), // Default text style
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'UI UX Designer\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: 'Comapy',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 53,
                          height: 28,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: ColorApp().color_black.withAlpha(20),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(0, 3))
                              ],
                              color: HexColor("#F6F6F6"),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "\$40/h",
                              style: GoogleFonts.poppins(
                                color: ColorApp().color_black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Top Company",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "See all",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ColorApp().color_green),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 30),
                        Container(
                          width: 140,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorApp().color_green),
                          child: Column(children: [
                            SizedBox(height: 30),
                            Image(
                                image: AssetImage(
                              "assets/images/google_img.png",
                            )),
                            SizedBox(height: 20),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  color: ColorApp().color_white,
                                ), // Default text style
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: 'Goole Inc\n',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Da Nang',
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 140,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorApp().color_green),
                          child: Column(children: [
                            SizedBox(height: 30),
                            Image(
                                image: AssetImage(
                              "assets/images/google_img.png",
                            )),
                            SizedBox(height: 20),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  color: ColorApp().color_white,
                                ), // Default text style
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: 'Goole Inc\n',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Da Nang',
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 140,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorApp().color_green),
                          child: Column(children: [
                            SizedBox(height: 30),
                            Image(
                                image: AssetImage(
                              "assets/images/google_img.png",
                            )),
                            SizedBox(height: 20),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  color: ColorApp().color_white,
                                ), // Default text style
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: 'Goole Inc\n',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Da Nang',
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar: Container(
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
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.house,
                    color: ColorApp().color_green,
                    size: 20,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.solidHeart,
                  color: ColorApp().color_white,
                  size: 22,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.plus,
                  color: ColorApp().color_white,
                  size: 22,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.solidBell,
                  color: ColorApp().color_white,
                  size: 22,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: ColorApp().color_white,
                  size: 22,
                ),
              ),
            ],
          ),
        ));
  }
}
