import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../commons/color_common.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
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
            SizedBox(height: 60),
            Center(
              child: Image(
                image: AssetImage("assets/images/success.png"),
              ),
            ),
            SizedBox(height: 10),
            Center(
                child: Text(
              "Password Changed!",
              style: GoogleFonts.poppins(
                  color: ColorApp().color_black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            )),
            Center(
              child: SizedBox(
                width: 300,
                child: Text(
                  "Your password has been changed successfully.",
                  style: GoogleFonts.poppins(
                      color: ColorApp().color_grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApp().color_green),
                child: SizedBox(
                  height: 60,
                  width: 320,
                  child: Center(
                    child: Text(
                      "Back to login",
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
            Container(
              height: 320,
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
          ],
        ),
      ),
    );
  }
}
