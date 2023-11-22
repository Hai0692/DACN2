import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/businessController.dart';
import 'package:flutter_job_hiring/pages/detailBusiness_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commons/color_common.dart';
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
  late List<Business> _business;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _business = [];
    getDataBusiness();
  }

  Future<void> getDataBusiness() async {
    _business = await BusinessController.getBusinessTest();
    setState(() {
      _isLoading = false;
    });
  }

   final BusinessController _businessController = Get.put(BusinessController());

  // var AllBusiness;
  // Future<void> getData() async {
  //   var responseAllBusiness = await BusinessController().getBusiness();
  //   if (responseAllBusiness != null) {
  //     setState(() {
  //       AllBusiness = json.decode(responseAllBusiness);
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }

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
                        "All Business",
                        style: GoogleFonts.poppins(
                            color: ColorApp().color_black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      )),
                  const SizedBox(height: 10),
                  const Center(child: Search_Form()),
                  Column(
                    children: [
                   if (AllBusiness == null)
                        ...{}
                      else ...{

                                  for (int i = 0; i <_business.length ; i++) ...{
                          businessDetails(
                            avatar:   _business[i].avatar,
                            name:  _business[i].name,
                            location: _business[i].location, 
                            career: _business[i].career, 
                            email: _business[i].email, 
                            phone: _business[i].phone, 
                            size: _business[i].size, 
                                    onPress: () async {
                              final detailBusinessResponse =
                                  await _businessController.BusinessDetails(
                                      _business[i].id);
                              var businessDetails =
                                  jsonDecode(detailBusinessResponse);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailBusiness(
                                          data: businessDetails)));
                            },
                          )
                        }
                        //AllBusiness.length
                        // for (int i = 0; i <AllBusiness.length ; i++) ...{
                        //   businessDetails(
                        //     avatar: AllBusiness[i]["avatar"].toString(),
                        //     name: AllBusiness[i]["name"].toString(),
                        //     location: AllBusiness[i]["location"].toString(),
                        //     career: AllBusiness[i]["career"].toString(),
                        //     email: AllBusiness[i]["email"].toString(),
                        //     phone: AllBusiness[i]["phone"].toString(),
                        //     size: AllBusiness[i]["size"],
                        //     onPress: () async {
                        //       final detailBusinessResponse =
                        //           await _businessController.BusinessDetails(
                        //               AllBusiness[i]["id"]);
                        //       var businessDetails =
                        //           jsonDecode(detailBusinessResponse);
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => DetailBusiness(
                        //                   data: businessDetails)));
                        //     },
                        //   )
                        // }
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
