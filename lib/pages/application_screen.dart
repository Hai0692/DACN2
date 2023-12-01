import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/applycationController.dart';
import 'package:flutter_job_hiring/widgets/background.dart';
import 'package:flutter_job_hiring/widgets/buttonBack.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commons/color_common.dart';
import '../controllers/authentication.dart';
import '../widgets/buttonInline.dart';
import '../widgets/customeBottom.dart';

class ApplicationPage extends StatefulWidget {
  final data;
  const ApplicationPage({super.key, this.data});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  final ApplycationController _applycationController =
      Get.put(ApplycationController());

  late TextEditingController _nameController;

  late TextEditingController _phoneController;
  final TextEditingController _coverLetterController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  FilePickerResult? result;
  late File resume_path;
  
  bool _isLoading = false;

  late String tokenUser;
  var user;
  // var userId;
  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    tokenUser = token;

    final responseUser = await Authentication().getUser(token);
    if (responseUser != null) {
      setState(() {
        user = json.decode(responseUser);
      });
    }
  }

  @override
  void initState() {
    getData();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (user != null && user["seeker"] != null) {
      _nameController = TextEditingController(text: user["seeker"]["name"]);
      _phoneController = TextEditingController(text: user["seeker"]["phone"]);
    }
    return Scaffold(
        body: Stack(children: [
          const Background(),
          Positioned(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formkey,
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Button_Back(),
                      Text(
                        "Apply for Job",
                        style: GoogleFonts.poppins(
                            color: ColorApp().color_black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(25),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: const Offset(0, 5),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: GestureDetector(
                                onTap: () async {
                                  _selectFile();
                                },
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.anglesUp,
                                        size: 20,
                                      ),
                                      Text(
                                        "Upload CV",
                                        style: GoogleFonts.poppins(
                                            color: ColorApp().color_black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(25),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: const Offset(0, 5),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.link,
                                      size: 20,
                                    ),
                                    Text(
                                      "Create CV",
                                      style: GoogleFonts.poppins(
                                          color: ColorApp().color_black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      if (user != null) ...{
                        Text(
                          "Name",
                          style: GoogleFonts.poppins(
                              color: ColorApp().color_black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: double.maxFinite,
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: user["seeker"]["name"] != null
                                    ? user["seeker"]["name"].toString()
                                    : "name",
                                hintStyle: GoogleFonts.poppins(
                                  color: ColorApp().color_grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Phone",
                          style: GoogleFonts.poppins(
                              color: ColorApp().color_black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: double.maxFinite,
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextFormField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: user["seeker"]["phone"] != null
                                    ? user["seeker"]["phone"].toString()
                                    : "phone",
                                hintStyle: GoogleFonts.poppins(
                                  color: ColorApp().color_grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      },
                      const SizedBox(height: 10),
                      Text(
                        "Reference Letter",
                        style: GoogleFonts.poppins(
                            color: ColorApp().color_black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: double.maxFinite,
                        height: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: TextFormField(
                            controller: _coverLetterController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  "Write a brief letter introduce yourself...",
                              hintStyle: GoogleFonts.poppins(
                                color: ColorApp().color_grey,
                                fontSize: 16,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.maxFinite,
                        height: 300,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 20, bottom: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Notice",
                                        style: GoogleFonts.poppins(
                                            color: ColorApp().color_black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const FaIcon(
                                        FontAwesomeIcons.triangleExclamation,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "1. Candidates should choose to apply using CV Online & write more wishes in the introductory letter section to have the CV viewed sooner by the Employer.\n2. TopCV advises all of you to always be careful during the job search process and proactively research company information and job positions before applying.\n3. Candidates need to be responsible for their application behavior. If you encounter recruitment news or receive suspicious contact from an employer, please immediately report to TopCV via email hotro@topcv.vn for timely support.",
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 20),
                      if (_isLoading) const CircularProgressIndicator(),
                      ButtonInline(
                          onPress: () async {
                            _submitApplication();
                          },
                          size: 320,
                          text: "Submit"),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
            ),
          ))
        ]),
        bottomNavigationBar: const Custome_Bottom());
  }

  Future<void> _selectFile() async {
    try {
      result = await FilePicker.platform.pickFiles();
      if (result != null) {
        setState(() {
          String filePath = result!.files.single.path!;
          resume_path = File(filePath);
        });

        print('File path: ${result!.files.single.path}');
        print('File name: ${result!.files.single.name}');
        print('File bytes: ${result!.files.single.bytes}');

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "You have upload CV",
            ),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        print('User canceled the file picking');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  Future<void> _submitApplication() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _applycationController.applyForJob(
          context: context,
        idJob: widget.data["id"],
        name: _nameController.text.toString(),
        phone: _phoneController.text.toString(),
        coverLetter: _coverLetterController.text.toString(),
        resumePath: resume_path,
        token: tokenUser,
      );
      _formkey.currentState?.reset();
      setState(() {
        resume_path = File('');
      });
   
    } catch (e) {
      print('Error submitting application: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }

   
  }

  @override
  void dispose() {
    // Đảm bảo giải phóng bộ nhớ khi widget bị hủy
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
