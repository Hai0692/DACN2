import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/test.dart';
import '../widgets/card_jobdetails.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<Test> {
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TestController jobController = Get.put(TestController());
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
    var response =
        await jobController.searchJobs(position, level.split(','), location);
    if (response != null) {
      setState(() {
        searchResult =
            List<Map<String, dynamic>>.from(json.decode(response)["data"]);
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
        title: const Text('Job Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _positionController,
              decoration: const InputDecoration(labelText: 'Position'),
            ),
            TextField(
              controller: _levelController,
              decoration:
                  const InputDecoration(labelText: 'Level (comma-separated)'),
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _onSearchPressed,
              child: const Text('Search'),
            ),
            if (searchResult == null)
              ...{}
            else ...{
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: searchResult.length,
                  itemBuilder: (BuildContext context, int i) {
                    Map<String, dynamic> historyApply = searchResult![i];
                    Map<String, dynamic> jobDetails = historyApply["job"];
                    Map<String, dynamic> businessDetails =
                        jobDetails["business"];

                    return detailJob(
                      id: jobDetails["id"],
                      avatar: businessDetails["avatar"].toString(),
                      company: businessDetails["name"].toString(),
                      level: jobDetails["level"].join(", "),
                      location: businessDetails["location"].toString(),
                      position: jobDetails["position"].toString(),
                      salary: jobDetails["salary"].toString(),
                      skill: jobDetails["skill"].join(", "),
                      type: jobDetails["type"].join(", "),
                      onPress: () async {},
                    );
                  },
                ),
              ),
            }
            // FutureBuilder(
            //   future: jobController.searchResults.stream.first,
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(child: CircularProgressIndicator());
            //     } else if (snapshot.hasError) {
            //       return Center(child: Text('Error: ${snapshot.error}'));
            //     } else {
            //       if (searchResult == null || searchResult!.isEmpty) {
            //         return const Center(
            //           child: Text(
            //             "No result",
            //             style: TextStyle(
            //               color: Colors.red,
            //               fontSize: 20,
            //               fontWeight: FontWeight.normal,
            //             ),
            //           ),
            //         );
            //       } else {
            //         return Expanded(
            //           child: ListView.builder(
            //             scrollDirection: Axis.vertical,
            //             itemCount: searchResult!.length,
            //             itemBuilder: (BuildContext context, int i) {
            //               Map<String, dynamic> historyApply = searchResult![i];
            //               Map<String, dynamic> jobDetails = historyApply["job"];
            //               Map<String, dynamic> businessDetails =
            //                   jobDetails["business"];

            //               return detailJob(
            //                 id: jobDetails["id"],
            //                 avatar: businessDetails["avatar"].toString(),
            //                 company: businessDetails["name"].toString(),
            //                 level: jobDetails["level"].join(", "),
            //                 location: businessDetails["location"].toString(),
            //                 position: jobDetails["position"].toString(),
            //                 salary: jobDetails["salary"].toString(),
            //                 skill: jobDetails["skill"].join(", "),
            //                 type: jobDetails["type"].join(", "),
            //                 onPress: () async {},
            //               );
            //             },
            //           ),
            //         );
            //       }
            //     }
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
