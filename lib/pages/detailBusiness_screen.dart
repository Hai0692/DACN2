import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/JobController.dart';
import 'package:flutter_job_hiring/controllers/businessController.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../commons/color_common.dart';
import '../widgets/background.dart';
import '../widgets/buttonBack.dart';
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
    final responseJobBusiness =
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
                    const SizedBox(height: 20),
                    const Button_Back(),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Business Detail",
                          style: GoogleFonts.poppins(
                              color: ColorApp().color_black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        )),
                    Container(
                      height: 170,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: ColorApp().color_black.withAlpha(20),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 3))
                        ],
                      ),
                      child: Column(children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              height: 120,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    HexColor("#6BCB7A"),
                                    HexColor("#6BCB7A").withAlpha(80),
                                  ],
                                ),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // const Image(
                                        //   image: AssetImage(
                                        //       "assets/images/logo.png"),
                                        //   width: 50,
                                        // ),
                                        Image.network(
                                          fit: BoxFit.contain,
                                          width: 50,
                                          height: 50,
                                          "${widget.data["avatar"]}",
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${widget.data["name"]}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Row(
                                              children: [
                                                const FaIcon(
                                                    FontAwesomeIcons
                                                        .locationDot,
                                                    size: 15),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "${widget.data["location"]}",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ]),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 10),
                                        width: 130,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: ColorApp()
                                                .color_green
                                                .withAlpha(80),
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const FaIcon(
                                              FontAwesomeIcons.userGroup,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              // "50 employees",
                                              "${widget.data["career"]}"
                                              " Employees",
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 10),
                                        width: 130,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: ColorApp()
                                                .color_green
                                                .withAlpha(80),
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const FaIcon(
                                              FontAwesomeIcons.accusoft,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "${widget.data["size"]}" " years",
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: ColorApp().color_green,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "${widget.data["phone"]}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: ColorApp().color_green,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.mail,
                                        color: ColorApp().color_green,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        "${widget.data["email"]}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: ColorApp().color_green,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ]),
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

                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            // height: 100,
                            // width: 350,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: ColorApp().color_black.withAlpha(20),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      fit: BoxFit.contain,
                                      width: 50,
                                      height: 50,
                                      "${job["business"]["avatar"]}",
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            job["position"].toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        //  const SizedBox(height: 5),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10),
                                              width: 80,
                                              child: Center(
                                                child: Text(
                                                  job["level"] is List
                                                      ? job["level"].join(", ")
                                                      : job["level"].toString(),
                                                  style: const TextStyle(
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10),
                                              width: 80,
                                              child: Center(
                                                child: Text(
                                                  job["type"] is List
                                                      ? job["type"].join(", ")
                                                      : job["type"].toString(),
                                                  style: const TextStyle(
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10),
                                              width: 80,
                                              child: Center(
                                                child: Text(
                                                  job["skill"] is List
                                                      ? job["skill"].join(", ")
                                                      : job["skill"].toString(),
                                                  style: const TextStyle(
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        " ${job["salary"]}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "Quantity:" " ${job["quantity"]}",
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ]),
                                const SizedBox(height: 10),
                              ],
                              // children: [
                              //   Image.network(
                              //     fit: BoxFit.contain,
                              //     width: 50,
                              //     height: 50,
                              //     "${job["business"]["avatar"]}",
                              //   ),
                              //   // const Image(
                              //   //   image: AssetImage("assets/images/logo.png"),
                              //   //   width: 50,
                              //   // ),
                              //   const SizedBox(width: 20),
                              //   Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     children: [
                              //       Text(
                              //         job["position"].toString(),
                              //         style: const TextStyle(
                              //           fontWeight: FontWeight.w500,
                              //           fontSize: 18,
                              //         ),
                              //       ),
                              //       Text(
                              //         "quantity: ${job["quantity"]}",
                              //         style: const TextStyle(
                              //           color: Colors.red,
                              //           fontSize: 16,
                              //         ),
                              //       ),
                              //       Text(
                              //         " ${job["salary"]}",
                              //         style: const TextStyle(
                              //           fontWeight: FontWeight.w500,
                              //           fontSize: 18,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              //   const SizedBox(width: 100),
                              //   const FaIcon(
                              //     FontAwesomeIcons.heart,
                              //     size: 20,
                              //     color: Colors.red,
                              //   ),
                              // ],
                            ),
                          );
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

  //  for (int i = 0; i < 1; i++) ...[
  //                     if (jobBusiness == null)
  //                       ...{}
  //                     else ...{
                        
  //                       Container(
  //                         margin: const EdgeInsets.symmetric(
  //                             horizontal: 20, vertical: 10),
  //                         padding: const EdgeInsets.symmetric(
  //                             vertical: 10, horizontal: 20),
  //                         height: 100,
  //                         width: 350,
  //                         decoration: BoxDecoration(
  //                           color: Colors.white,
  //                           boxShadow: [
  //                             BoxShadow(
  //                                 color: ColorApp().color_black.withAlpha(20),
  //                                 spreadRadius: 4,
  //                                 blurRadius: 10,
  //                                 offset: const Offset(0, 3))
  //                           ],
  //                           borderRadius: BorderRadius.circular(20),
  //                         ),
  //                         child: Row(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             const Image(
  //                               image: AssetImage("assets/images/logo.png"),
  //                               width: 50,
  //                             ),
  //                             const SizedBox(width: 10),
  //                             Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceAround,
  //                               children: [
  //                                 Text(
  //                                   jobBusiness[i]["position"].toString(),
  //                                   style: const TextStyle(
  //                                     fontWeight: FontWeight.w500,
  //                                     fontSize: 18,
  //                                   ),
  //                                 ),
  //                                 const Text(
  //                                   "Quality: 4",
  //                                   style: TextStyle(
  //                                     color: Colors.red,
  //                                     fontSize: 16,
  //                                   ),
  //                                 ),
  //                                 const Text(
  //                                   "500",
  //                                   style: TextStyle(
  //                                     fontWeight: FontWeight.w500,
  //                                     fontSize: 18,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             const SizedBox(width: 40),
  //                             const FaIcon(
  //                               FontAwesomeIcons.heart,
  //                               size: 25,
  //                               color: Colors.red,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     },
  //                   ],
