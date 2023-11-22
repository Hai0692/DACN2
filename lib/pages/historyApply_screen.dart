import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/applycationController.dart';
import 'package:flutter_job_hiring/controllers/authentication.dart';
import 'package:flutter_job_hiring/widgets/background.dart';
import 'package:flutter_job_hiring/widgets/buttonBack.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commons/color_common.dart';
import '../widgets/card_jobdetails.dart';

class HistoryApplyPage extends StatefulWidget {
  const HistoryApplyPage({super.key});

  @override
  State<HistoryApplyPage> createState() => _HistoryApplyPageState();
}

class _HistoryApplyPageState extends State<HistoryApplyPage> {
  final Authentication authentication = Get.put(Authentication());
  var dataJob;
  String? userToken;
  Future<void> getData() async {
    final SharedPreferences Pref = await SharedPreferences.getInstance();
    var token = Pref.getString("token") ?? "";
    userToken = token;

    if (token.isNotEmpty) {
      final response = await ApplycationController().historyApply(token);
      if (response != null) {
        setState(() {
          dataJob = json.decode(response);
        });
      }
      print("response: $response");
    }
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
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Button_Back(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "History Apply",
                  style: GoogleFonts.poppins(
                      color: ColorApp().color_black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              if (dataJob == null) ...{
                const Center(
                  child: Text(
                    "No application found",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              } else ...{
                for (int i = 0; i <= dataJob.length; i++) ...{
                  detailJob(
                      avatar: dataJob["application_history"][i]["job"]
                              ["business"]["avatar"]
                          .toString(),
                      company: dataJob["application_history"][i]["job"]
                              ["business"]["name"]
                          .toString(),
                      level: dataJob["application_history"][i]["job"]["level"] is List
                          ? dataJob["application_history"][i]["job"]["level"]
                              .join(", ")
                          : dataJob["application_history"][i]["job"]["level"]
                              .toString(),
                      location: dataJob["application_history"][i]["job"]
                              ["business"]["location"]
                          .toString(),
                      position: dataJob["application_history"][i]["job"]
                              ["position"]
                          .toString(),
                      salary: dataJob["application_history"][i]["job"]["salary"].toString(),
                      skill: dataJob["application_history"][i]["job"]["skill"] is List ? dataJob["application_history"][i]["job"]["skill"].join(", ") : dataJob["application_history"][i]["job"]["skill"].toString(),
                      type: dataJob["application_history"][i]["job"]["type"] is List ? dataJob["application_history"][i]["job"]["type"].join(", ") : dataJob["application_history"][i]["job"]["type"].toString(),
                      onPress: () {}),
                }
              }
            ],
          )),
        ))
      ]),
    );
  }
}
