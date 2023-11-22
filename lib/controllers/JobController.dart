import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constains/constains.dart';
import '../models/job.dart';

class JobController extends GetxController {
  Future<dynamic> popularJob() async {
    try {
      var popolarJob = await http
          .get(Uri.parse('${url}job'), headers: {'Accept': 'application/json'});
      if (popolarJob.statusCode == 200 && popolarJob.body != '') {
        String jsonsDataString = popolarJob.body.toString();
    
        return popolarJob.body;
      }
    } catch (error) {
      return error;
    }
  }

  Future<dynamic> jobDetails(int id) async {
    try {
      var jobDetails = await http.get(Uri.parse('${url}job/$id'),
          headers: {'Accept': 'application/json'});
      if (jobDetails.statusCode == 200 && jobDetails.body != '') {
        var result = jsonDecode(jobDetails.body);
        return jobDetails.body;
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> jobBusiness(int id) async {
    try {
      var jobBusiness = await http.get(Uri.parse('${url}job/business/$id'),
          headers: {'Accept': 'application/json'});
      if (jobBusiness.statusCode == 200 && jobBusiness.body != '') {
        var result = jsonDecode(jobBusiness.body);
        print(" success: $result");
        return jobBusiness.body;
      }
    } catch (e) {
      return e;
    }
  }

  Future<Map<String, dynamic>> search({
    String? position,
    List<String>? level,
    String? location,
  }) async {
    try {
      final response = await http.get(Uri.parse('${url}/search'),
          headers: {'Accept': 'application/json'});


      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
  
        throw Exception(
            'Failed to search. Status code: ${response.statusCode}');
      }
    } catch (e) {
     
      throw Exception('Failed to search: $e');
    }
  }

   static Future<List<Job>> getAllJob() async {
    try {
     var allJob = await http
          .get(Uri.parse('${url}job'), headers: {'Accept': 'application/json'});
      if (allJob.statusCode == 200) {

        List<dynamic> result = json.decode(allJob.body);
        List<Job> data =
            result.map((json) => Job.fromJson(json)).toList();

        return data;
      } else {
        print('Failed to load data. Status Code: ${allJob.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }

    return [];
  }
}
