import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/jobCotroller.dart';
import 'package:flutter_job_hiring/models/job.dart';
import 'package:flutter_job_hiring/providers/favorite_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/favoriteController.dart';
import '../controllers/searchController.dart';
import '../widgets/background.dart';
import '../widgets/buttonBack.dart';
import '../widgets/buttonInline.dart';
import '../widgets/card_jobdetails.dart';
import '../widgets/customeBottom.dart';
import 'detailJob_screen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchController searchController = Get.put(SearchController());
  final JobController testController = Get.put(JobController());
  final FavoriteController favoriteController = Get.put(FavoriteController());
  late String userToken;
  Future<void> getData() async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      var token = pref.getString("token");
      userToken = token ?? "";
    } catch (e) {
      print("$e");
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
                _buildTextField(
                    'Position', searchController.positionController),
                _buildTextField('Level', searchController.levelController),
                _buildTextField(
                    'Location', searchController.locationController),
                const SizedBox(height: 20),
                Center(
                  child: ButtonInline(
                    size: 320,
                    text: "Search",
                    onPress: () {
                      searchController.searchJobs();
                    },
                  ),
                ),
                Expanded(
                  child: _buildSearchResultsList(
                      searchController, testController, favoriteProvider),
                ),
              ],
            ),
          ),
        ]),
        bottomNavigationBar: const Custome_Bottom());
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: labelText),
      ),
    );
  }

  Widget _buildSearchResultsList(SearchController searchController,
      JobController testController, FavoriteProvider favoriteProvider) {
    return Obx(() {
      var searchResults = searchController.searchResults.value;
      if (searchResults.isEmpty) {
        return const Center(
            child: Text(
          'No results found.',
          style: TextStyle(color: Colors.red),
        ));
      } else {
        return ListView.builder(
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            var job = searchResults[index];
            return detailJob(
              //    isInFavorites: favoriteProvider.isInFavorites,
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
                JobTest response = await testController.getDetailJob(job.id);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailJob(data: response)));
              },
              onPressFavorite: () {
                Favorite(favoriteProvider, job);
              },
            );
          },
        );
      }
    });
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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Please login',
      )));
    }
  }
}
