import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/JobController.dart';
import 'package:get/get.dart';
import '../controllers/searchController.dart';
import '../widgets/background.dart';
import '../widgets/buttonBack.dart';
import '../widgets/buttonInline.dart';
import '../widgets/card_jobdetails.dart';
import '../widgets/customeBottom.dart';
import 'detailJob_screen.dart';

class SearchPage extends StatelessWidget {
  final SearchController searchController = Get.put(SearchController());
  final JobController jobController = Get.put(JobController());

  SearchPage({super.key});

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
                  child: _buildSearchResultsList(),
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

  Widget _buildSearchResultsList() {
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
              avatar: job.avatar,
              company: job.name,
              level: job.level,
              location: job.location,
              position: job.position,
              salary: job.salary,
              skill: job.skill,
              type: job.type,
              onPress: () async {
                final response = await jobController.jobDetails(job.id);
                final result = jsonDecode(response);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailJob(data: result)));
              },
            );
            // return ListTile(
            //   title: Text(job.position),
            //   subtitle: Text(job.name),
            //   // Add more details as needed
            // );
          },
        );
      }
    });
  }
}
