import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../commons/color_common.dart';
import '../controllers/authentication.dart';
import '../widgets/buttonInline.dart';
import '../widgets/iconMedia.dart';
import '../widgets/inputTextform.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final Authentication _authenticationController = Get.put(Authentication());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
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
                        offset: const Offset(0, 5),
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
                        Navigator.pop(context);
                      }),
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Text(
                    "Hello! Register to get \nstarted",
                    style: GoogleFonts.poppins(
                        color: ColorApp().color_black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  )),
              const SizedBox(height: 10.0),
              InputTextform(
                controller: _nameController,
                text: "User name",
                icon: FaIcon(
                  FontAwesomeIcons.user,
                  color: ColorApp().color_grey,
                  size: 20,
                ),
              ),
              const SizedBox(height: 20.0),
              InputTextform(
                controller: _emailController,
                text: "Email address",
                icon: FaIcon(
                  FontAwesomeIcons.envelope,
                  color: ColorApp().color_grey,
                  size: 20,
                ),
              ),
              const SizedBox(height: 20),
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
              InputTextform(
                controller: _phoneController,
                text: "Phone",
                icon: FaIcon(
                  FontAwesomeIcons.phone,
                  color: ColorApp().color_grey,
                  size: 20,
                ),
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    height: 270,
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
                  Obx(() {
                    return _authenticationController.isLoading.value
                        ? Positioned(
                            top: 30,
                            left: 25,
                            child: ButtonInline(
                                size: 320, text: "Register", onPress: () {}))
                        : Positioned(
                            top: 30,
                            left: 25,
                            child: ButtonInline(
                              size: 320,
                              text: "Register",
                              onPress: () async {
                                if (_formkey.currentState!.validate()) {
                                  await _authenticationController.registerUser(
                                    name: _nameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                    phone: _phoneController.text.trim(),
                                  );
                                } else {
                                  print("unsuccess");
                                }
                              },
                            ));
                  }),
                  Positioned(
                    top: 105,
                    left: 32,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 0.5,
                            width: 80,
                            color: ColorApp().color_grey),
                        const SizedBox(width: 20),
                        Text("Or Register with",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: ColorApp().color_black)),
                        const SizedBox(width: 20),
                        Container(
                            height: 0.5,
                            width: 80,
                            color: ColorApp().color_grey),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 150,
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
                  Positioned(
                    top: 230,
                    left: 60,
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          color: ColorApp().color_black,
                        ), // Default text style
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'You have an account? ',
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}
