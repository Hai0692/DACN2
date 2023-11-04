import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commons/color_common.dart';
import '../controllers/JobController.dart';
import '../widgets/background.dart';
import '../widgets/buttonBack.dart';
import '../widgets/card_jobdetails.dart';
import '../widgets/customeBottom.dart';
import '../widgets/searchForm.dart';
import 'detailJob_screen.dart';

class AllJob extends StatefulWidget {
  const AllJob({super.key});

  @override
  State<AllJob> createState() => _AllJobState();
}

class _AllJobState extends State<AllJob> {
  final JobController _jobController = Get.put(JobController());

  var AllJob;
  Future<void> getData() async {
    final responsePopularJob = await JobController().popularJob();
    if (responsePopularJob != null) {
      setState(() {
        AllJob = jsonDecode(responsePopularJob);
      });
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Button_Back(),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "All Job",
                        style: GoogleFonts.poppins(
                            color: ColorApp().color_black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      )),
                  const SizedBox(height: 10),
                  const Center(child: Search_Form()),
                  Column(
                    children: [
                      const SizedBox(width: 10),
                      if (AllJob == null)
                        ...{}
                      else ...{
                        for (int i = 0; i < AllJob.length; i++) ...{
                          detailJob(
                            
                            avatar: AllJob[i]["business"]["avatar"],
                            company: AllJob[i]["business"]["name"],
                            position: AllJob[i]["position"],
                            level: AllJob[i]["level"] is List
                                ? AllJob[i]["level"].join(", ")
                                : AllJob[i]["level"].toString(),
                            skill: AllJob[i]["skill"] is List
                                ? AllJob[i]["skill"].join(", ")
                                : AllJob[i]["skill"].toString(),
                            type: AllJob[i]["type"] is List
                                ? AllJob[i]["type"].join(", ")
                                : AllJob[i]["type"].toString(),
                            salary: AllJob[i]["salary"],
                            location: AllJob[i]["business"]["location"],
                            onPress:()async{
                                     final jobDetailsResponse = await _jobController
                                    .jobDetails(AllJob[i]["id"]);
                                var jobDetails = jsonDecode(jobDetailsResponse);
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailJob(data: jobDetails),
                                  ),
                                );
                            }
                          ),
                        }
                      }
                    ],
                  )
//
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar: const Custome_Bottom());
  }
}
