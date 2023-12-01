


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constains/constains.dart';
import 'package:http_parser/http_parser.dart';

class ApplycationController extends GetxController {
  final isLoading = false.obs;
  Future<void> applyForJob({
      required BuildContext context,
    required String token,
    required int idJob,
    required String name,
    required String phone,
    required String coverLetter,
    required File resumePath,
  }) async {
    try {
      isLoading.value = true;

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${url}seeker/job/$idJob/apply'));

      request.headers.addAll(headers);
      // Attach form data
      request.fields['name'] = name;
      request.fields['phone'] = phone;
      request.fields['cover_letter'] = coverLetter;

      // Attach the resume file

      request.files.add(http.MultipartFile(
        'resume_path',
        resumePath.readAsBytes().asStream(),
        resumePath.lengthSync(),
        filename: resumePath.path.split('/').last,
        contentType: MediaType('application', 'pdf'),
      ));
      var response = await request.send();
      if (response.statusCode == 201) {
        isLoading.value = false;
       
        print('Application submitted successfully ');
        ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Submitted application successfully",
        ),
        duration: Duration(seconds: 2),
      ),
    );
      } else {
           ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Submit application fail",
        ),
        duration: Duration(seconds: 2),
      ),
    );
     
        print(
            'Failed to submit application. Status code: ${response.statusCode}');
        print(await response.stream.bytesToString());
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  Future<dynamic> historyApply(String token) async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}seeker/apply/history'),
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 && response.body != '') {
        String jsonsData = response.body.toString();
        return jsonsData;
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

}
