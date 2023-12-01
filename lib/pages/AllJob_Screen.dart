import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/favoriteController.dart';
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
  final FavoriteController favoriteController = Get.put(FavoriteController());

  var JobData;
  Future<void> getData() async {
    var responseAllJob = await JobController().job();
    if (responseAllJob != null) {
      setState(() {
        JobData = jsonDecode(responseAllJob);
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
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Button_Back(),
                  ),
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
                      if (JobData == null) ...{
                        const Center(
                          child: CircularProgressIndicator(),
                        )
                      } else ...{
                        for (int i = 0; i < JobData.length; i++) ...{
                          detailJob(
                              id: JobData[i]["id"],
                              avatar:
                                  JobData[i]["business"]["avatar"].toString(),
                              company:
                                  JobData[i]["business"]["name"].toString(),
                              position: JobData[i]["position"].toString(),
                              level: JobData[i]["level"] is List
                                  ? JobData[i]["level"].join(", ")
                                  : JobData[i]["level"].toString(),
                              skill: JobData[i]["skill"] is List
                                  ? JobData[i]["skill"].join(", ")
                                  : JobData[i]["skill"].toString(),
                              type: JobData[i]["type"] is List
                                  ? JobData[i]["type"].join(", ")
                                  : JobData[i]["type"].toString(),
                              salary: JobData[i]["salary"].toString(),
                              location:
                                  JobData[i]["business"]["location"].toString(),
                              onPress: () async {
                                final jobDetailsResponse = await _jobController
                                    .jobDetails(JobData[i]["id"]);
                                var jobDetails = jsonDecode(jobDetailsResponse);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailJob(data: jobDetails),
                                  ),
                                );
                              }),
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
