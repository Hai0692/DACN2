import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../commons/color_common.dart';
import '../controllers/authentication.dart';
import '../models/auth_model.dart';
import '../widgets/buttonBack.dart';
import '../widgets/buttonInline.dart';
import '../widgets/iconMedia.dart';
import '../widgets/inputTextform.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final Authentication _authenticationController = Get.put(Authentication());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Button_Back(),
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
            const SizedBox(height: 30.0),
            InputTextform(
              controller: _emailController,
              text: "Email address",
              icon: FaIcon(
                FontAwesomeIcons.envelope,
                color: ColorApp().color_grey,
                size: 20,
              ),
            ),
            const SizedBox(height: 30),
            InputTextform(
              controller: _passwordController,
              text: "Password",
              icon: FaIcon(
                FontAwesomeIcons.lock,
                color: ColorApp().color_grey,
                size: 20,
              ),
            ),
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
                        HexColor("#8BED73"),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
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
                Consumer<AuthModel>(builder: (context, auth, child) {
                  return Positioned(
                    top: 60,
                    left: 25,
                    child: ButtonInline(
                      size: 320,
                      text: "Login",
                      onPress: () async {
                        final token = await _authenticationController.getToken(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                        if (token != null) {
                          auth.loginSuccess();

                          _authenticationController.loginUser(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const HomePage(),
                          //   ),
                          // );
                        }
                      },
                    ),
                  );
                }),

                // Positioned(
                //   top: 60,
                //   left: 25,
                //   child: ButtonInline(
                //     size: 320,
                //     text: "Login",
                //     onPress: () async {
                //       final token = await _authenticationController.getToken(
                //           email: _emailController.text.trim(),
                //           password: _passwordController.text.trim());
                //       if (token != null) {
                //         //     auth.loginSuccess();
                //         Navigator.of(context).push(
                //           MaterialPageRoute(
                //               builder: (context) => const HomePage()),
                //         );
                //       }
                //     },
                //   ),
                // ),
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
                const SizedBox(height: 30),
                Positioned(
                  top: 220,
                  left: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      IconMedia(image: "assets/icons/facebook_ic.png"),
                      SizedBox(width: 20),
                      IconMedia(image: "assets/icons/apple_ic.png"),
                      SizedBox(width: 20),
                      IconMedia(image: "assets/icons/google_ic.png"),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
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
          ],
        ),
      ),
    );
  }
}
