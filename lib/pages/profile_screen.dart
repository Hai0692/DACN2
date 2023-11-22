import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/pages/splash_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commons/color_common.dart';
import '../controllers/authentication.dart';
import '../widgets/background.dart';
import '../widgets/buttonBack.dart';
import '../widgets/customeBottom.dart';
import 'editProfile_screen.dart';
import 'historyApply_screen.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  final Authentication _authentication = Get.put(Authentication());
  String? tokenUser;

  Future<void> getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token') ?? '';

    tokenUser = token;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          const Background(),
          Positioned(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Button_Back(),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Profile",
                        style: GoogleFonts.poppins(
                            color: ColorApp().color_black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      )),

                  Container(
                    //  height: 100,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: ColorApp().color_black.withAlpha(20),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (content) => const Edit_Profile()));
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.green.withAlpha(90),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorApp().color_black.withAlpha(20),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.user,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "My account",
                                    style: GoogleFonts.poppins(
                                      color: ColorApp().color_black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "Make a change to your account",
                                    style: GoogleFonts.poppins(
                                      color: ColorApp().color_grey,
                                      //  fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: Colors.black,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (content) =>
                                      const HistoryApplyPage()));
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.green.withAlpha(90),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorApp().color_black.withAlpha(20),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.bookmark,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "History",
                                    style: GoogleFonts.poppins(
                                      color: ColorApp().color_black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "Manage your access history",
                                    style: GoogleFonts.poppins(
                                      color: ColorApp().color_grey,
                                      //  fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: Colors.black,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green.withAlpha(90),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorApp().color_black.withAlpha(20),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.heart,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Favorite",
                                  style: GoogleFonts.poppins(
                                    color: ColorApp().color_black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Your favorites listt",
                                  style: GoogleFonts.poppins(
                                    color: ColorApp().color_grey,
                                    //  fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.black,
                            size: 15,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green.withAlpha(90),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorApp().color_black.withAlpha(20),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.shieldHalved,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "My CV",
                                  style: GoogleFonts.poppins(
                                    color: ColorApp().color_black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Manage your CV",
                                  style: GoogleFonts.poppins(
                                    color: ColorApp().color_grey,
                                    //  fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.black,
                            size: 15,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () async {
                          _authentication.logOut();
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.green.withAlpha(90),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorApp().color_black.withAlpha(20),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.rightFromBracket,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Log out",
                                    style: GoogleFonts.poppins(
                                      color: ColorApp().color_black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "Sign out of your account",
                                    style: GoogleFonts.poppins(
                                      color: ColorApp().color_grey,
                                      //  fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: Colors.black,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "More",
                      style: GoogleFonts.poppins(
                        color: ColorApp().color_black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    //  height: 100,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: ColorApp().color_black.withAlpha(20),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green.withAlpha(90),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorApp().color_black.withAlpha(20),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.question,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: 250,
                            child: Text(
                              "Help & Support",
                              style: GoogleFonts.poppins(
                                color: ColorApp().color_black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.black,
                            size: 15,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green.withAlpha(90),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorApp().color_black.withAlpha(20),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.ban,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: 250,
                            child: Text(
                              "About Us",
                              style: GoogleFonts.poppins(
                                color: ColorApp().color_black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.black,
                            size: 15,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                    ]),
                  )
//
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar: const Custome_Bottom());
  }

  // Function to show the alert dialog
  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //   title: Text('Logout'),
          content: const Text('Logout Success'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
