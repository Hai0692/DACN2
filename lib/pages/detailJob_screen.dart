import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/jobCotroller.dart';
import 'package:flutter_job_hiring/models/job.dart';
import 'package:flutter_job_hiring/widgets/buttonInline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../commons/color_common.dart';
import '../widgets/background.dart';
import '../widgets/buttonBack.dart';
import '../widgets/card_jobdetails.dart';
import '../widgets/customeBottom.dart';
import 'Application_screen.dart';

class DetailJob extends StatefulWidget {
  final JobTest data;
  const DetailJob({super.key, required this.data});

  @override
  State<DetailJob> createState() => _DetailJobState();
}

class _DetailJobState extends State<DetailJob> {
  final JobController testController = Get.put(JobController());

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
                        "Job Detail",
                        style: GoogleFonts.poppins(
                            color: ColorApp().color_black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      )),
//
                  detailJob(
                    onPress: () {},
                    id: widget.data.id,
                    avatar: widget.data.business.avatar,
                    company: widget.data.business.name,
                    level: widget.data.level.join(','),
                    location: widget.data.business.location,
                    position: widget.data.position,
                    salary: widget.data.salary,
                    skill: widget.data.skill.join(','),
                    type: widget.data.type.join(','),
                  ),

                  Container(
                      height: 170,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: HexColor("#E5FFE1"),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: ColorApp().color_black.withAlpha(20),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 3))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const FaIcon(FontAwesomeIcons.pencil, size: 15),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Job description",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              widget.data.content,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                      height: 170,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: HexColor("#E5FFE1"),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: ColorApp().color_black.withAlpha(20),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 3))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const FaIcon(FontAwesomeIcons.checkDouble,
                                    size: 15),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Requirements",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              widget.data.requirement,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                      height: 170,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: HexColor("#E5FFE1"),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: ColorApp().color_black.withAlpha(20),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 3))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const FaIcon(FontAwesomeIcons.paperclip,
                                    size: 15),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Benefits",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              widget.data.benefits,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(height: 10),
                  Center(
                      child: ButtonInline(
                          text: "Apply now",
                          onPress: () async {
                            JobTest jobDetails =
                      await testController.getDetailJob(widget.data.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ApplicationPage(data: jobDetails),
                              ),
                            );
                          },
                          size: 320)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar: const Custome_Bottom());
  }
}
