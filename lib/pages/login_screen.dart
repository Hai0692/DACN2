import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../commons/color_common.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(20),
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
                      offset: Offset(0, 5),
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
                      // Navigator.pop(context);
                    }),
              ),
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text(
                  "Welcom back! Indeed \nto see you, Again!",
                  style: GoogleFonts.poppins(
                      color: ColorApp().color_black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                )),
            SizedBox(height: 30.0),
            Center(
              child: Container(
                width: 350,
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: HexColor("#E7E3E3"), // Border color
                    width: 0.5, // Border width
                  ),
                  color: ColorApp().color_grey_light,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: FaIcon(
                        FontAwesomeIcons.envelope,
                        color: ColorApp().color_grey,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      hintText: 'Email Address',
                      hintStyle: GoogleFonts.poppins(
                        color: ColorApp().color_grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                width: 350,
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(color: HexColor("#E7E3E3"), width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                    color: ColorApp().color_grey_light,
                    boxShadow: [
                      BoxShadow(
                          color: ColorApp().color_black.withAlpha(20),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 3))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: FaIcon(
                        FontAwesomeIcons.lock,
                        color: ColorApp().color_grey,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: GoogleFonts.poppins(
                        color: ColorApp().color_grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        HexColor("#FFFFFF").withAlpha(10),
                        HexColor("#AAE89A"),
                        HexColor("#74FF52"),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 220),
                    child: Text(
                      "Forgot a password",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorApp().color_green),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 25,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp().color_green),
                    child: SizedBox(
                      height: 60,
                      width: 320,
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            color: ColorApp().color_white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 0.5, width: 90, color: ColorApp().color_grey),
                      const SizedBox(width: 20),
                      Text("Or login with",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: ColorApp().color_black)),
                      const SizedBox(width: 20),
                      Container(
                          height: 0.5, width: 90, color: ColorApp().color_grey),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Positioned(
                  top: 220,
                  left: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Image(
                              image: AssetImage("assets/icons/facebook_ic.png"),
                              width: 26,
                              height: 26),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Image(
                              image: AssetImage("assets/icons/apple_ic.png"),
                              width: 26,
                              height: 26),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Image(
                              image: AssetImage("assets/icons/google_ic.png"),
                              width: 26,
                              height: 26),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Positioned(
                  top: 310,
                  left: 50,
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        color: ColorApp().color_black,
                      ), // Default text style
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'Register now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.only(left: 220),
            //   child: Text(
            //     "Forgot a password",
            //     style: GoogleFonts.poppins(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w400,
            //         color: ColorApp().color_green),
            //   ),
            // ),
            // const SizedBox(height: 30.0),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: ColorApp().color_green),
            //     child: SizedBox(
            //       height: 60,
            //       width: 320,
            //       child: Center(
            //         child: Text(
            //           "Login",
            //           style: GoogleFonts.poppins(
            //             color: ColorApp().color_white,
            //             fontSize: 18,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 30),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(height: 0.5, width: 90, color: ColorApp().color_grey),
            //     const SizedBox(width: 20),
            //     Text("Or login with",
            //         style: GoogleFonts.poppins(
            //             fontWeight: FontWeight.w400,
            //             fontSize: 18,
            //             color: ColorApp().color_black)),
            //     const SizedBox(width: 20),
            //     Container(height: 0.5, width: 90, color: ColorApp().color_grey),
            //   ],
            // ),
            // SizedBox(height: 30),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Container(
            //       width: 100,
            //       height: 60,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Center(
            //         child: Image(
            //             image: AssetImage("assets/icons/facebook_ic.png"),
            //             width: 26,
            //             height: 26),
            //       ),
            //     ),
            //     Container(
            //       width: 100,
            //       height: 60,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Center(
            //         child: Image(
            //             image: AssetImage("assets/icons/apple_ic.png"),
            //             width: 26,
            //             height: 26),
            //       ),
            //     ),
            //     Container(
            //       width: 100,
            //       height: 60,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Center(
            //         child: Image(
            //             image: AssetImage("assets/icons/google_ic.png"),
            //             width: 26,
            //             height: 26),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 30),
            // Center(
            //   child: RichText(
            //     text: TextSpan(
            //       style: GoogleFonts.poppins(
            //         color: ColorApp().color_black,
            //       ), // Default text style
            //       children: const <TextSpan>[
            //         TextSpan(
            //           text: 'Don\'t have an account? ',
            //           style: TextStyle(
            //             fontWeight: FontWeight.w400,
            //             fontSize: 16,
            //           ),
            //         ),
            //         TextSpan(
            //           text: 'Register now',
            //           style: TextStyle(
            //             fontSize: 16,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
