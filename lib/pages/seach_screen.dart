import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/JobController.dart';
import '../widgets/card_jobdetails.dart';
import 'detailJob_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final JobController jobController = Get.put(JobController());
  String position = '';
  String level = '';
  String location = '';
 void _onSearchPressed() {
  setState(() {
    position = _positionController.text;
    level = _levelController.text;
    location = _locationController.text;
  });

  jobController.searchJobs(position, level.split(','), location);
}

   var searchResult;
    Future<void> getData() async {
      var response = await jobController.searchJobs(position, level.split(','), location);
      if (response != null) {
        setState(() {
           searchResult = List<Map<String, dynamic>>.from(
              json.decode(response)["data"]);
        //  searchResult = jsonDecode(response);
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
      appBar: AppBar(
        title: Text('Job Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _positionController,
              decoration: InputDecoration(labelText: 'Position'),
            ),
            TextField(
              controller: _levelController,
              decoration: InputDecoration(labelText: 'Level (comma-separated)'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _onSearchPressed,
              child: Text('Search'),
            ),

                  if (searchResult == null) ...{
               // const Center(child: CircularProgressIndicator())
              } else if (searchResult!.isEmpty) ...{
                const Center(
                  child: Text(
                    "No result",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              } else ...{
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: searchResult!.length,
                    itemBuilder: (BuildContext context, int i) {
                      Map<String, dynamic> historyApply = searchResult![i];

                      Map<String, dynamic> jobDetails = historyApply["job"];
                      Map<String, dynamic> businessDetails =jobDetails["business"];
                      return detailJob(
                        //    isInFavorites: favoriteProvider.isInFavorites,
                        id: jobDetails["id"],
                        avatar: businessDetails["avatar"].toString(),
                        company: businessDetails["name"].toString(),
                        level: jobDetails["level"].join(", "),
                        location: businessDetails["location"].toString(),
                        position: jobDetails["position"].toString(),
                        salary: jobDetails["salary"].toString(),
                        skill: jobDetails["skill"].join(", "),
                        type: jobDetails["type"].join(", "),
                        onPress: () async {
                          final response =
                              await jobController.jobDetails(jobDetails["id"]);
                          final result = jsonDecode(response);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailJob(data: result)));
                        },

                      
                      );
                    },
                  ),
                ),
              }


          ],
        ),
      ),
    );
  }
}
