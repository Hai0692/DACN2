import 'dart:convert';

import 'package:flutter_job_hiring/models/business.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constains/constains.dart';

class BusinessController extends GetxController {
  Rx<List<BusinessTest>> result = Rx<List<BusinessTest>>([]);

   Future<BusinessTest> getBusinessDetails(int id) async {
    try {
       var businessDetails = await http.get(Uri.parse('${url}business/$id'),
          headers: {'Accept': 'application/json'});

      if (businessDetails.statusCode == 200) {
        print('$id');
        BusinessTest result = BusinessTest.fromJson(json.decode(businessDetails.body));
        return result;
      } else if (businessDetails.statusCode == 404) {
        print('Job not found with ID: $id');
        throw Exception(
            'Failed to load data. Status Code: ${businessDetails.statusCode}');
      } else {
        print('Job not found with ID: $id');
        throw Exception(
            'Failed to load data. Status Code: ${businessDetails.statusCode}');
      }
    } catch (e) {
      // Xử lý các exception khác
      print('Error: $e');
      rethrow;
    }
  }
  

   Future<List<BusinessTest>> getAllBusiness() async {
    try {
      var business = await http.get(Uri.parse('${url}business'),
          headers: {'Accept': 'application/json'});

      if (business.statusCode == 200) {
        List<dynamic> result = json.decode(business.body);
        List<BusinessTest> data =
            result.map((json) => BusinessTest.fromJson(json)).toList();

        return data;
      } else {
        print('Failed to load data. Status Code: ${business.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
       return [];
    }

   
  }
}
