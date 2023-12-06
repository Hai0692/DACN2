import 'dart:convert';

import 'package:flutter_job_hiring/models/job.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constains/constains.dart';

class JobController extends GetxController {
  Rx<List<JobTest>> result = Rx<List<JobTest>>([]);
  Future<List<JobTest>> getAllJob() async {
    try {
      var allJob = await http
          .get(Uri.parse('${url}job'), headers: {'Accept': 'application/json'});
      if (allJob.statusCode == 200) {
        List<dynamic> result = json.decode(allJob.body);
        List<JobTest> data =
            result.map((json) => JobTest.fromJson(json)).toList();

        return data;
      } else {
        print('Failed to load data. Status Code: ${allJob.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  Future<List<JobTest>> getPopularJob() async {
    try {
      var allJob = await http.get(Uri.parse('${url}job/highest'),
          headers: {'Accept': 'application/json'});
      if (allJob.statusCode == 200) {
        List<dynamic> result = json.decode(allJob.body);
        List<JobTest> data =
            result.map((json) => JobTest.fromJson(json)).toList();

        return data;
      } else {
        print('Failed to load data. Status Code: ${allJob.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  Future<List<JobTest>> getJobforBusiness(int id) async {
    try {
      var job = await http.get(Uri.parse('${url}job/business/$id'),
          headers: {'Accept': 'application/json'});
      if (job.statusCode == 200) {
        List<dynamic> result = json.decode(job.body);
        List<JobTest> data =
            result.map((json) => JobTest.fromJson(json)).toList();
        print('$id');
        return data;
      } else {
        print('Failed to load data. Status Code: ${job.statusCode}');
        return [];
      }
    } catch (e) {
      print('error: $e');
      return [];
    }
  }

  Future<JobTest> getDetailJob(int id) async {
    try {
      final detailJob = await http.get(
        Uri.parse('${url}job/$id'),
        headers: {'Accept': 'application/json'},
      );

      if (detailJob.statusCode == 200) {
        print('$id');
        JobTest result = JobTest.fromJson(json.decode(detailJob.body));
        return result;
      } else if (detailJob.statusCode == 404) {
        print('Job not found with ID: $id');
        throw Exception(
            'Failed to load data. Status Code: ${detailJob.statusCode}');
      } else {
        print('Job not found with ID: $id');
        throw Exception(
            'Failed to load data. Status Code: ${detailJob.statusCode}');
      }
    } catch (e) {
      // Xử lý các exception khác
      print('Error: $e');
      rethrow;
    }
  }

  


  




}
