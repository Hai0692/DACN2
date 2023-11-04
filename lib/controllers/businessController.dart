import 'dart:convert';

import 'package:flutter_job_hiring/models/business.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constains/constains.dart';

class BusinessController extends GetxController {
  final business = <Business>[].obs;
//get doctor data
  Future<dynamic> getBusiness() async {
    try {
      var business = await http.get(Uri.parse('${url}business'),
          headers: {'Accept': 'application/json'});
      if (business.statusCode == 200 && business.body != '') {
        return business.body;
      }
    } catch (error) {
      return error;
    }
  }

  Future<dynamic> BusinessDetails(int id) async {
    try {
      var businessDetails = await http.get(Uri.parse('${url}business/$id'),
          headers: {'Accept': 'application/json'});
      if (businessDetails.statusCode == 200 && businessDetails.body != '') {
        var result = jsonDecode(businessDetails.body);
        print(" success: $result");
        return businessDetails.body;
      }
    } catch (error) {
      return error;
    }
  }
}
