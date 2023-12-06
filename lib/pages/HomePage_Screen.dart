import 'dart:convert';

import 'package:flutter/material.dart'; // Corrected import statement
import 'package:flutter_job_hiring/models/business.dart';
import 'package:flutter_job_hiring/widgets/background.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commons/color_common.dart';
import '../controllers/authentication.dart';
import '../controllers/businessController.dart';
import '../controllers/favoriteController.dart';
import '../controllers/jobCotroller.dart';
import '../models/job.dart';
import '../providers/favorite_provider.dart';
import '../widgets/buttonInline.dart';
import '../widgets/customeBottom.dart';
import '../widgets/popolarJob.dart';
import '../widgets/searchForm.dart';
import '../widgets/seeAll.dart';
import '../widgets/topCompany.dart';
import 'AllBusiness_screen.dart';
import 'AllJob_Screen.dart';
import 'detailBusiness_screen.dart';
import 'detailJob_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key); // Fixed the constructor syntax

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BusinessController businessController = Get.put(BusinessController());
  final JobController testController = Get.put(JobController());
  final Authentication _authentication = Get.put(Authentication());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  var user;
  late String tokenUser;

  Future<void> getData() async {
    try {
      testController.result.value = await testController.getPopularJob();
      businessController.result.value =
          await businessController.getAllBusiness();
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token') ?? '';

      tokenUser = token;
      if (token.isNotEmpty) {
        final responseUser = await _authentication.getUser(token);

        if (responseUser != null) {
          setState(() {
            user = json.decode(responseUser);
          });
        }
      }
    } catch (error) {
      print('Error fetching jobs: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
        body: Stack(
          children: [
            const Background(),
            Positioned(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                //physics: const AlwaysScrollableScrollPhysics(),
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
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Welcom back!\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              if (user == null) ...{
                                const TextSpan(
                                  text: "None",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                )
                              } else ...{
                                TextSpan(
                                  text: user["seeker"]["name"].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              }
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
                    _buildResultPopularJob(favoriteProvider),
                    const SizedBox(height: 20),
                    See_All(
                      name: "Top Company",
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllBusiness()));
                      },
                    ),
                    _buildPopularBusiness(),
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
                          ButtonInline(
                              text: "Create", onPress: () {}, size: 100)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const Custome_Bottom());
  }

  Widget _buildPopularBusiness() {
    var result = businessController.result.value;

    if (result.length >= 5) {
      return SizedBox(
        height: 500,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            BusinessTest business = result[index];
            return Top_Company(
              location: business.location,
              company: business.name,
              career: business.career,
              avatar: business.avatar,
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
        ),
      );
    } else {
      return const SizedBox.shrink(); // or any other placeholder or message
    }
  }

  Widget _buildResultPopularJob(FavoriteProvider favoriteProvider) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: testController.result.value.length,
        itemBuilder: (context, index) {
          JobTest job = testController.result.value[index];
          return Popular_Job(
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
              JobTest jobDetails = await testController.getDetailJob(job.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailJob(data: jobDetails),
                ),
              );
            },
            onPressFavorite: () async {
              bool isAlreadyInFavorites =
                  favoriteProvider.isInFavorites(job.id);

              try {
                favoriteProvider.setInFavorites(job.id, !isAlreadyInFavorites);

                bool actionResult = await favoriteController.manageFavorite(
                    tokenUser, job.id,
                    isAdd: !isAlreadyInFavorites);

                if (actionResult) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isAlreadyInFavorites
                            ? 'Job removed from favorites'
                            : 'Job added to favorites',
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to update favorites'),
                    ),
                  );
                }
              } catch (e) {
                print("Error: $e");
                favoriteProvider.setInFavorites(job.id, isAlreadyInFavorites);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('An error occurred. Please try again.'),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
