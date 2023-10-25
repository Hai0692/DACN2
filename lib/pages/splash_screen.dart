import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../commons/color_common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        HexColor("#7DF260"),
                        HexColor("#AAE69B"),
                        HexColor("#FFFFFF").withAlpha(0),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  top: 100,
                  child: Image(
                    image: AssetImage("assets/images/man.png"),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Image(
              image: AssetImage("assets/images/logo.png"),
              width: 80,
            ),
            const SizedBox(height: 5),
            RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  color: ColorApp().color_black,
                ), // Default text style
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Indeed',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  TextSpan(
                    text: 'Seeking',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp().color_green,
              ),
              child: SizedBox(
                height: 60,
                width: 250,
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
            const SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: ColorApp().color_green,
                  width: 1.5,
                ),
              ),
              child: SizedBox(
                height: 60,
                width: 250,
                child: Center(
                  child: Text(
                    "Outline Button",
                    style: GoogleFonts.poppins(
                      color: ColorApp().color_green,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "Continue as a guest",
              style: GoogleFonts.poppins(
                color: ColorApp().color_black,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
