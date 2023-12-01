import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constains/constains.dart';

class TestController extends GetxController {
  Rx<Map<String, dynamic>> searchResults = Rx<Map<String, dynamic>>({});

  // Other methods and logic in your controller...

  // Ensure that you have a method to update searchResults
  Future<dynamic> searchJobs(String? position, List<String>? levels, String? location) async {
    searchResults.value = await _searchJobs(position, levels, location);
  }

  Future<dynamic> _searchJobs(String? position, List<String>? levels, String? location) async {
    
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
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
      
        print(response.body);
        return json.decode(response.body);
      } else {
        print('Error: ${response.statusCode}');
        return []; 
      }
    } catch (e) {
      print('An error occurred: $e');
      return [];
    }
  }
}
