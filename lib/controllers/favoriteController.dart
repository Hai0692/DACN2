import 'package:flutter_job_hiring/constains/constains.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FavoriteController extends GetxController {
  final isLoading = false.obs;
  Future<dynamic> getFavorite(String token) async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}seeker/favorites'),
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 && response.body != '') {
        String jsonData = response.body.toString();
        return jsonData;
      }
    } catch (e) {
      isLoading.value = false;
      return e;
    }
  }
  
 Future<bool> manageFavorite(String token, int id, {bool isAdd = true}) async {
    try {
      isLoading.value = true;
      var response;
      if (isAdd) {
        response = await http.put(
          Uri.parse('${url}seeker/favorites/$id'),
          headers: {'Authorization': 'Bearer $token'},
        );
      } else {
        response = await http.delete(
          Uri.parse('${url}seeker/favorites/$id'),
          headers: {'Authorization': 'Bearer $token'},
        );
      }

      if (response.statusCode == 200) {
        if (isAdd) {
          if (response.body != '') {
          
            print("Job added to favorites");
            return true;
          } else {
            print("Failed to add job to favorites: Empty response body");
            return false;
          }
        } else {
          print("Job removed from favorites");
          return true;
        }
      } else if (response.statusCode == 403 && isAdd) {
        print("You already have this job in favorites");
        return false;
      } else if (response.statusCode == 404 && !isAdd) {
        print("Job not found in favorites");
        return false;
      } else {
        print(
            "Failed to ${isAdd ? 'add' : 'remove'} job to/from favorites: ${response.statusCode}");
        print("Response Body: ${response.body}");
        return false;
      }
    } catch (e) {
      // Handle errors
      print(
          "Error ${isAdd ? 'adding' : 'removing'} job to/from favorites: $e");
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
