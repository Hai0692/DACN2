import 'package:flutter/material.dart'; // Corrected import statement
import 'package:flutter_job_hiring/controllers/favoriteController.dart';
import 'package:flutter_job_hiring/providers/favorite_provider.dart';
import 'package:flutter_job_hiring/widgets/background.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commons/color_common.dart';
import '../controllers/jobCotroller.dart';
import '../models/job.dart';
import '../widgets/buttonBack.dart';
import '../widgets/card_jobdetails.dart';
import '../widgets/customeBottom.dart';
import 'detailJob_screen.dart';

class AllJob extends StatefulWidget {
  const AllJob({Key? key}) : super(key: key); // Fixed the constructor syntax

  @override
  State<AllJob> createState() => _AllJobPageState();
}

class _AllJobPageState extends State<AllJob> {
  final JobController testController = Get.put(JobController());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  late String userToken;
  Future<void> getData() async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      var token = pref.getString("token");
      userToken = token ?? "";
      testController.result.value = await testController.getAllJob();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Button_Back(), // Corrected widget name
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "All Job",
                      style: GoogleFonts.poppins(
                          color: ColorApp().color_black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(child: _buildResultAllJob(favoriteProvider)),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const Custome_Bottom());
  }

  Widget _buildResultAllJob(FavoriteProvider favoriteProvider) {
    return Obx(
      () {
        var result = testController.result.value;
        if (result.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
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
                onPressFavorite: () {
                  Favorite(favoriteProvider, job);
                },
              );
            },
          );
        }
      },
    );
  }
  

  Future<void> Favorite(FavoriteProvider favoriteProvider, JobTest job) async {
    if (userToken.isNotEmpty) {
      bool isAlreadyInFavorites = favoriteProvider.isInFavorites(job.id);
      try {
        favoriteProvider.setInFavorites(job.id, !isAlreadyInFavorites);
        bool actionResult = await favoriteController
            .manageFavorite(userToken, job.id, isAdd: !isAlreadyInFavorites);
        if (actionResult) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            isAlreadyInFavorites
                ? 'Job removed from favorites'
                : 'Job added to favorites',
          )));
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
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        'Please login',
      )));
    }
  }
}
