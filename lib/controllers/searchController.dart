import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../constains/constains.dart';
import '../models/job.dart';

class SearchController extends GetxController {
  final TextEditingController positionController = TextEditingController();
  final TextEditingController levelController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  Rx<List<Job>> searchResults = Rx<List<Job>>([]);

  Future<void> searchJobs() async {
    var position = positionController.text;
    var levels = levelController.text.split(',').map((e) => e.trim()).toList();
    var location = locationController.text;

    searchResults.value = await _searchJobs(position, levels, location);
  }

  Future<List<Job>> _searchJobs(
      String? position, List<String>? levels, String? location) async {
    try {
      var levelsString = levels?.isNotEmpty ?? false ? levels!.join(',') : '';

      var queryParams = {
        'position': position,
        if (levels?.isNotEmpty ?? false) 'level': levelsString,
        'location': location,
      };

      var uri = Uri.parse('${url}search').replace(queryParameters: queryParams);

      var response = await http.get(
        uri,
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        // Lấy danh sách công việc từ khóa 'data'
        var jobsData = data['data'] as List<dynamic>;

        // Chuyển đổi dữ liệu công việc từ Map sang danh sách Job
        List<Job> jobs = jobsData.map((jobData) => Job.fromJson(jobData)).toList();

        searchResults.value = jobs;
        return jobs;
      } else {
        print('Error: ${response.statusCode}');
        // Xử lý trường hợp lỗi ở đây
        return [];
      }
    } catch (e) {
      print('An error occurred: $e');
      // Xử lý trường hợp lỗi ở đây
      return [];
    }
  }
}
