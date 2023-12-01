import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/JobController.dart';
import 'package:flutter_job_hiring/controllers/businessController.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commons/color_common.dart';
import '../widgets/background.dart';
import '../widgets/buttonBack.dart';
import '../widgets/card_businessDetails.dart';
import '../widgets/card_jobdetails.dart';
import '../widgets/customeBottom.dart';
import '../widgets/searchForm.dart';

class DetailBusiness extends StatefulWidget {
  final data;
  const DetailBusiness({super.key, this.data});

  @override
  State<DetailBusiness> createState() => _DetailBusinessbState();
}

class _DetailBusinessbState extends State<DetailBusiness> {
  final BusinessController _businessController = Get.put(BusinessController());
  final JobController _jobController = Get.put(JobController());
  var jobBusiness;

  Future<void> getData() async {
    var responseJobBusiness =
        await JobController().jobBusiness(widget.data["id"]);
    if (responseJobBusiness != null) {
      setState(() {
        jobBusiness = jsonDecode(responseJobBusiness);
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
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Button_Back(),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Business Detail",
                          style: GoogleFonts.poppins(
                              color: ColorApp().color_black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        )),
                    businessDetails(
                      avatar: widget.data["avatar"].toString(),
                      name: widget.data["name"].toString(),
                      location: widget.data["location"].toString(),
                      email: widget.data["email"].toString(),
                      career: widget.data["career"].toString(),
                      phone: widget.data["phone"].toString(),
                      size: widget.data["size"],
                      onPress: () {},
                    ),
                    const Center(child: Search_Form()),
                    if (jobBusiness == null || jobBusiness.length == null)
                      ...{}
                    else ...{
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: jobBusiness.length,
                        itemBuilder: (BuildContext context, int index) {
                          final job = jobBusiness[index];
                          return detailJob(
                            id: job["id"],
                            avatar: job["business"]["avatar"].toString(),
                            company: job["business"]["name"].toString(),
                            level: job["level"].join(", "),
                            location: job["business"]["location"].toString(),
                            position: job["position"].toString(),
                            salary: job["salary"].toString(),
                            skill: job["skill"].join(", "),
                            type: job["type"].join(", "),
                            onPress: () {},
                          );

                          // return Container(
                          //   margin: const EdgeInsets.symmetric(
                          //       horizontal: 20, vertical: 10),
                          //   padding: const EdgeInsets.symmetric(
                          //       vertical: 10, horizontal: 20),
                          //   // height: 100,
                          //   // width: 350,
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color: ColorApp().color_black.withAlpha(20),
                          //         spreadRadius: 4,
                          //         blurRadius: 10,
                          //         offset: const Offset(0, 3),
                          //       ),
                          //     ],
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Row(
                          //         children: [
                          //           Image.network(
                          //             fit: BoxFit.contain,
                          //             width: 50,
                          //             height: 50,
                          //             "${job["business"]["avatar"]}",
                          //           ),
                          //           Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               Padding(
                          //                 padding:
                          //                     const EdgeInsets.only(left: 10),
                          //                 child: Text(
                          //                   job["position"].toString(),
                          //                   style: const TextStyle(
                          //                     fontWeight: FontWeight.w500,
                          //                     fontSize: 18,
                          //                   ),
                          //                 ),
                          //               ),
                          //               //  const SizedBox(height: 5),
                          //               Row(
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.start,
                          //                 children: [
                          //                   Container(
                          //                     padding:
                          //                         const EdgeInsets.symmetric(
                          //                             horizontal: 5,
                          //                             vertical: 10),
                          //                     width: 80,
                          //                     child: Center(
                          //                       child: Text(
                          //                         job["level"] is List
                          //                             ? job["level"].join(", ")
                          //                             : job["level"].toString(),
                          //                         style: const TextStyle(
                          //                             fontSize: 14),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Container(
                          //                     padding:
                          //                         const EdgeInsets.symmetric(
                          //                             horizontal: 5,
                          //                             vertical: 10),
                          //                     width: 80,
                          //                     child: Center(
                          //                       child: Text(
                          //                         job["type"] is List
                          //                             ? job["type"].join(", ")
                          //                             : job["type"].toString(),
                          //                         style: const TextStyle(
                          //                             fontSize: 14),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Container(
                          //                     padding:
                          //                         const EdgeInsets.symmetric(
                          //                             horizontal: 5,
                          //                             vertical: 10),
                          //                     width: 80,
                          //                     child: Center(
                          //                       child: Text(
                          //                         job["skill"] is List
                          //                             ? job["skill"].join(", ")
                          //                             : job["skill"].toString(),
                          //                         style: const TextStyle(
                          //                             fontSize: 14),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //               const SizedBox(height: 5),
                          //             ],
                          //           )
                          //         ],
                          //       ),
                          //       Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceAround,
                          //           children: [
                          //             Text(
                          //               " ${job["salary"]}",
                          //               style: const TextStyle(
                          //                 fontWeight: FontWeight.w500,
                          //                 fontSize: 18,
                          //               ),
                          //             ),
                          //             Text(
                          //               "Quantity:" " ${job["quantity"]}",
                          //               style: const TextStyle(
                          //                 color: Colors.red,
                          //                 fontWeight: FontWeight.w500,
                          //                 fontSize: 18,
                          //               ),
                          //             ),
                          //           ]),
                          //       const SizedBox(height: 10),
                          //     ],
                          //   ),
                          // );
                        },
                      )
                    }
                  ]),
            ),
          )
        ]),
        bottomNavigationBar: const Custome_Bottom());
  }
}
