import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/authentication.dart';
import 'package:flutter_job_hiring/pages/login_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../commons/color_common.dart';

import '../widgets/buttonBack.dart';
import '../widgets/buttonInline.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final Authentication controller = Get.put(Authentication());
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Button_Back(),
            ),
            Container(
                margin: const EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  "Forgot Password",
                  style: GoogleFonts.poppins(
                      color: ColorApp().color_black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                )),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 10, right: 10),
              child: Text(
                "Don't worry! It occurs. Please enter the email address linked with your account.",
                style: GoogleFonts.poppins(
                    color: ColorApp().color_grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 30.0),
            Center(
              child: Container(
                width: 350,
                height: 60,
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4),
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
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      icon: FaIcon(
                        FontAwesomeIcons.envelope,
                        color: ColorApp().color_grey,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter your email',
                      hintStyle: GoogleFonts.poppins(
                        color: ColorApp().color_grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
                child: ButtonInline(
              size: 320,
              text: "Send code",
              onPress: () async {
                await controller.forgotPassword(email: emailController.text);
                if (controller.isLoading.value) {
                   ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Loalding...Please wait",
                              ),
                              duration: Duration(seconds: 3),
                            ),
                          );
                } else {
                     ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                 'Success, Reset password link sent to your email.',
                              ),
                              duration: Duration(seconds: 10),
                            ),
                          );
                  // Success
               
                }
              },
            )),
            const SizedBox(height: 20),
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
                  top: 290,
                  left: 60,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          color: ColorApp().color_black,
                        ), // Default text style
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'Remember Password ?  ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: 'Login now',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
