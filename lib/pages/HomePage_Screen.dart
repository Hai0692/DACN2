import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/JobController.dart';
import 'package:flutter_job_hiring/pages/AllJob_Screen.dart';
import 'package:flutter_job_hiring/widgets/buttonInline.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commons/color_common.dart';
import '../controllers/businessController.dart';
import '../widgets/background.dart';
import '../widgets/customeBottom.dart';
import '../widgets/popolarJob.dart';
import '../widgets/topCompany.dart';
import '../widgets/searchForm.dart';
import '../widgets/seeAll.dart';
import 'detailBusiness_screen.dart';
import 'detailJob_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BusinessController _businessController = Get.put(BusinessController());
  final JobController _jobController = Get.put(JobController());

  var businessData;
  var popularJobData;
  Future<void> getData() async {
    final responseBusiness = await BusinessController().getBusiness();
    final responsePopularJob = await JobController().popularJob();
    if (responseBusiness != null && responsePopularJob != null) {
      setState(() {
        businessData = jsonDecode(responseBusiness);
        popularJobData = jsonDecode(responsePopularJob);
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
                children: [
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            color: ColorApp().color_black,
                          ), // Default text style
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Welcom back!\n',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text: 'John',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Image(
                        width: 60,
                        image: AssetImage("assets/images/logo.png"),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Search_Form(),
                  const SizedBox(height: 20),
                  See_All(
                    name: "Popular job",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllJob()));
                    },
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(width: 10),
                        for (int i = 0; i < 5; i++) ...[
                          if (popularJobData == null)
                            ...{}
                          else ...{
                            Popular_Job(
                              company: popularJobData[i]["business"]["name"]
                                  .toString(),
                              position:
                                  popularJobData[i]["position"].toString(),
                              level: popularJobData[i]["level"] is List
                                  ? popularJobData[i]["level"].join(", ")
                                  : popularJobData[i]["level"].toString(),

                              //  level: popularJobData[i]["level"][0].toString(),
                              salary: popularJobData[i]["salary"].toString(),
                              skill: popularJobData[i]["skill"] is List
                                  ? popularJobData[i]["skill"].join(", ")
                                  : popularJobData[i]["level"].toString(),
                              type: popularJobData[i]["type"] is List
                                  ? popularJobData[i]["type"].join(", ")
                                  : popularJobData[i]["level"].toString(),

                              //    type: popularJobData[i]["type"][0].toString(),
                              avatar: popularJobData[i]["business"]["avatar"],
                              location: popularJobData[i]["business"]
                                      ["location"]
                                  .toString(),
                              onPress: () async {
                                final jobDetailsResponse = await _jobController
                                    .jobDetails(popularJobData[i]["id"]);
                                var jobDetails = jsonDecode(jobDetailsResponse);
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailJob(data: jobDetails),
                                  ),
                                );
                              },
                            ),
                          }
                        ]
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  See_All(
                    name: "Top Company",
                    onPress: () {},
                  ),
                  for (int i = 0; i < 4; i++) ...[
                    if (businessData == null)
                      ...{}
                    else ...{
                      Top_Company(
                        location: businessData[i]["location"].toString(),
                        company: businessData[i]["name"].toString(),
                        career: businessData[i]["career"].toString(),
                        avatar: businessData[i]["avatar"].toString(),
                        onPress: () async {
                          final businessDetailResponse =
                              await _businessController.BusinessDetails(
                                  businessData[i]["id"]);
                          var businessDetails =
                              jsonDecode(businessDetailResponse);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailBusiness(data: businessDetails),
                            ),
                          );
                        },
                      ),
                    }
                  ],
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            " people are creating their CV with InDeedCV now",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(width: 20),
                        ButtonInline(text: "Create", onPress: () {}, size: 100)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar: const Custome_Bottom());
  }
}
