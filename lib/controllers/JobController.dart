import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constains/constains.dart';

class JobController extends GetxController {
  Future<dynamic> popularJob() async {
    try {
      var popolarJob = await http
          .get(Uri.parse('${url}job'), headers: {'Accept': 'application/json'});
      if (popolarJob.statusCode == 200 && popolarJob.body != '') {
        var result = json.decode(popolarJob.body);
      
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
        print(" success: $result");
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
}
