import 'dart:convert';
import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/authentication.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../commons/color_common.dart';
import '../widgets/background.dart';
import '../widgets/buttonBack.dart';
import '../widgets/buttonInline.dart';
import '../widgets/customeBottom.dart';
import '../widgets/inputTextform.dart';
import 'package:image_picker/image_picker.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  XFile? _pickerFile;
  final ImagePicker _picker = ImagePicker();
  DateTime? selectedDate;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dayOfbirthController = TextEditingController();

  final Authentication _authentication = Get.put(Authentication());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var user;
  String? tokenUser;
  Future<void> getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token') ?? '';
    tokenUser = token;
    if (token.isNotEmpty) {
      final responseUser = await Authentication().getUser(token);

      if (responseUser != null) {
        setState(() {
          user = json.decode(responseUser);
        });
      }
    }
    print("token: $tokenUser");
  }

  @override
  void initState() {
    getData();
    if (user != null && user["seeker"] != null) {
      _nameController = TextEditingController(text: user["seeker"]["name"]);
      _emailController = TextEditingController(text: user["seeker"]["email"]);
      _phoneController = TextEditingController(text: user["seeker"]["phone"]);
      _addressController =
          TextEditingController(text: user["seeker"]["address"]);
      _dayOfbirthController =
          TextEditingController(text: user["seeker"]["birthday"]);
    }
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
              child: Form(
                key: _formkey,
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
                          "Edit your profile",
                          style: GoogleFonts.poppins(
                              color: ColorApp().color_black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        )),
                    const SizedBox(height: 10),
                    Center(
                      child: Stack(children: [
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: _pickerFile == null
                              ? const AssetImage("assets/images/logo.png")
                                  as ImageProvider
                              : FileImage(File(_pickerFile!.path)),
                        ),
                        Positioned(
                          bottom: 2.0,
                          right: 2.0,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()),
                              );
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: ColorApp().color_grey,
                              child: FaIcon(
                                FontAwesomeIcons.plus,
                                color: ColorApp().color_white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    if (user != null) ...{
                      Center(
                        child: Text(
                          user["seeker"]["name"].toString(),
                          style: GoogleFonts.poppins(
                            color: ColorApp().color_black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InputTextform(
                        controller: _nameController,
                        text: user["seeker"]["name"] != null
                            ? user["seeker"]["name"].toString()
                            : "name",
                        icon: FaIcon(
                          FontAwesomeIcons.user,
                          color: ColorApp().color_grey,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      InputTextform(
                        controller: _emailController,
                        text: user["seeker"]["email"] != null
                            ? user["seeker"]["email"].toString()
                            : "email",
                        icon: FaIcon(
                          FontAwesomeIcons.envelope,
                          color: ColorApp().color_grey,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      InputTextform(
                        controller: _addressController,
                        text: user["seeker"]["address"] != null
                            ? user["seeker"]["address"].toString()
                            : "address",
                        icon: FaIcon(
                          FontAwesomeIcons.solidAddressBook,
                          color: ColorApp().color_grey,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      InputTextform(
                        controller: _phoneController,
                        text: user["seeker"]["phone"] != null
                            ? user["seeker"]["phone"].toString()
                            : "phone",
                        icon: FaIcon(
                          FontAwesomeIcons.phone,
                          color: ColorApp().color_grey,
                          size: 20,
                        ),
                      ),
                      // ignore: equal_elements_in_set
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: 350,
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: HexColor("#E7E3E3"), width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                              color: ColorApp().color_grey_light,
                              boxShadow: [
                                BoxShadow(
                                    color: ColorApp().color_black.withAlpha(20),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextFormField(
                              controller: _dayOfbirthController,
                              decoration: InputDecoration(
                                icon: GestureDetector(
                                  onTap: () {
                                    _showDatePicker(context);
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.calendar,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                ),
                                border: InputBorder.none,
                                hintText: user["seeker"]["birthday"] != null
                                    ? user["seeker"]["birthday"].toString()
                                    : "birthday",
                                hintStyle: GoogleFonts.poppins(
                                  color: ColorApp().color_grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    },
                    Center(
                        child: ButtonInline(
                            size: 320,
                            text: "Update Profile",
                            onPress: () async {
                              try {
                                if (_nameController.text.isEmpty) {
                                  // Hiển thị thông báo hoặc thực hiện các hành động phù hợp khi 'name' trống rỗng.
                                  return;
                                }
                                await _authentication.updateUserData(
                                  token: tokenUser,
                                  email: _emailController.text.toString(),
                                  address: _addressController.text.toString(),
                                  phone: _phoneController.text.toString(),
                                  name: _nameController.text.toString(),
                                  birthday:
                                      _dayOfbirthController.text.toString(),
                                );
                                print(_nameController.text);
                                print(tokenUser);
                              } catch (e) {
                                print("Error updating profile: $e");
                              }
                            })),
                    const SizedBox(height: 20),
                    //
                  ],
                ),
              ),
            ),
          )
        ]),
        bottomNavigationBar: const Custome_Bottom());
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime currentDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? currentDate,
      firstDate: DateTime.utc(2000, 10, 16),
      lastDate: currentDate,
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        final formattedDate =
            formatDate(selectedDate!, [dd, '/', mm, '/', yyyy]);
        _dayOfbirthController.text = formattedDate;
      });

      final formattedDate = formatDate(picked, [dd, '/', mm, '/', yyyy]);

      // Định dạng ngày
      print('Ngày đã chọn: $formattedDate');
    }
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: ColorApp().color_grey,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera, size: 20, color: ColorApp().color_grey),
              onPressed: () {
                takePhoto(
                  ImageSource.camera,
                );
              },
              label: Text("Camera",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: ColorApp().color_green,
                      fontWeight: FontWeight.w500)),
            ),
            TextButton.icon(
              icon: Icon(Icons.image, size: 20, color: ColorApp().color_grey),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: ColorApp().color_green,
                      fontWeight: FontWeight.w500)),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _pickerFile = pickedFile;
    });
  }
}
