import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_job_hiring/controllers/businessController.dart';
import 'package:flutter_job_hiring/controllers/jobCotroller.dart';
import 'package:flutter_job_hiring/models/business.dart';
import 'package:flutter_job_hiring/models/job.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commons/color_common.dart';
import '../widgets/background.dart';
import '../widgets/buttonBack.dart';
import '../widgets/card_businessDetails.dart';
import '../widgets/card_jobdetails.dart';
import '../widgets/customeBottom.dart';
import '../widgets/searchForm.dart';
import 'detailJob_screen.dart';

class DetailBusiness extends StatefulWidget {
  final BusinessTest data;
  const DetailBusiness({super.key,required this.data});

  @override
  State<DetailBusiness> createState() => _DetailBusinessbState();
}

class _DetailBusinessbState extends State<DetailBusiness> {
  final BusinessController businessController = Get.put(BusinessController());
  final JobController testController = Get.put(JobController());
  

  Future<void> getData() async {
    try {
      testController.result.value =
          await testController.getJobforBusiness(widget.data.id);
         
    } catch (e) {
      print("e");
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
                    id: widget.data.id,
                    avatar: widget.data.avatar,
                    name: widget.data.name,
                    location: widget.data.location,
                    email: widget.data.email,
                    career: widget.data.career,
                    phone: widget.data.phone,
                    size: widget.data.size,
                    onPress: () {},
                  ),
                  const Center(child: Search_Form()),
                  Expanded(child: _buildResultJobForBusiness()),
            
                ]),
          )
        ]),
        bottomNavigationBar: const Custome_Bottom());
  }

  Widget _buildResultJobForBusiness() {
    return Obx(() {
      var result = testController.result.value;
      if (result.isEmpty || result.length == null) {
        return Center(
            child: Text(
          "No Job for this Business",
          style: TextStyle(fontSize: 20, color: Colors.red),
        ));
      } else {
        return ListView.builder(
          scrollDirection: Axis.vertical,
            itemCount: result.length,
            itemBuilder: (context, index) {
              JobTest job = result[index];
                    return detailJob(
                id: job.id,
                avatar: job.business.avatar,
                company: job.business.name,
                level: job.level.join(','),
                location: job.business.location,
                position: job.position,
                salary: job.salary,
                skill: job.skill.join(','),
                type: job.type.join(','),
                onPress: () async {
                  JobTest jobDetails =
                      await testController.getDetailJob(job.id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailJob(data: jobDetails),
                    ),
                  );
                },
              ); 
            });
      }
    });
  }
}
