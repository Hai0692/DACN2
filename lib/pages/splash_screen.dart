import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/pages/HomePage_Screen.dart';
import 'package:flutter_job_hiring/pages/login_screen.dart';
import 'package:flutter_job_hiring/pages/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commons/color_common.dart';
import '../widgets/buttonOutline.dart';
import '../widgets/buttonInline.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == true) {
      return const HomePage();
    } else {
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
              ButtonInline(
                text: "Login",
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
                size: 250,
              ),
              const SizedBox(height: 15),
              ButtonOutline(
                text: "Register",
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterPage()));
                },
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: Text(
                    "Continue as a guest",
                    style: GoogleFonts.poppins(
                      color: ColorApp().color_black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
