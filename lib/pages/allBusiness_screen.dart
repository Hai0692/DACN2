import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/businessController.dart';
import 'package:flutter_job_hiring/pages/detailBusiness_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commons/color_common.dart';
import '../controllers/jobCotroller.dart';
import '../models/business.dart';
import '../widgets/background.dart';
import '../widgets/buttonBack.dart';
import '../widgets/card_businessDetails.dart';
import '../widgets/customeBottom.dart';
import '../widgets/searchForm.dart';

class AllBusiness extends StatefulWidget {
  const AllBusiness({super.key});

  @override
  State<AllBusiness> createState() => _AllBusinessState();
}

class _AllBusinessState extends State<AllBusiness> {
  BusinessController businessController = Get.put(BusinessController());

   final JobController testController = Get.put(JobController());
  Future<void> getDataBusiness() async {
    try {
      businessController.result.value =
          await businessController.getAllBusiness();
    } catch (e) {
      print("$e");
    }
  }
   @override
  void initState() {
    super.initState();
    getDataBusiness();
  }


  final BusinessController _businessController = Get.put(BusinessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          const Background(),
          Positioned(
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
                      "All Business",
                      style: GoogleFonts.poppins(
                          color: ColorApp().color_black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    )),
                const SizedBox(height: 10),
                const Center(child: Search_Form()),
            Expanded(child: _buildResultAllBusiness()),
//
              ],
            ),
          )
        ]),
        bottomNavigationBar: const Custome_Bottom());
  }

    Widget _buildResultAllBusiness() {
    return Obx(
      () {
        var result = businessController.result.value;
        if (result.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: result.length,
            itemBuilder: (context, index) {
              BusinessTest business = result[index];
              return businessDetails(
                id: business.id,
                avatar: business.avatar,
          career: business.career,
          email: business.email,
          name: business.name,
          phone: business.phone,
          size: business.size,
                location: business.location,
              
                   onPress: () async {
                    BusinessTest businessDetails = await businessController.getBusinessDetails(business.id);
              
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailBusiness(data: businessDetails),
                  ),
                );
              },
              );
            },
          );
        }
      },
    );
  }
}
