import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/models/user.dart';
import 'package:flutter_job_hiring/pages/splash_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constains/constains.dart';
import '../pages/HomePage_Screen.dart';
import '../pages/login_screen.dart';

class Authentication extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;

  final box = GetStorage();
  //get token
  Future<dynamic> getToken({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'email': email,
        'password': password,
      };
      var response = await http.post(
        Uri.parse('${url}seeker/login'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );
      if (response.statusCode == 200 && response.body != '') {
        isLoading.value = false;
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', json.decode(response.body)['token']);
        return json.decode(response.body)['token'];
      } else {
        isLoading.value = false;
        Get.snackbar('Error', json.decode(response.body)['message'],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (error) {
      isLoading.value = false;
      return error;
    }
  }

  Future<UserModel> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      };
      var response = await http.post(
        Uri.parse('${url}seeker/register'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );
      if (response.statusCode == 201) {
        isLoading.value = false;
        box.write('token', token.value);
        Get.off(() => const LoginPage());
      } else if (response.statusCode == 409) {
        isLoading.value = false;
      } else {
        isLoading.value = false;
        print("HTTP Request Failed with status code: ${response.statusCode}");
        print("Server Response: ${response.body}");
      }

      return UserModel();
    } catch (e) {
      isLoading.value = false;
      print("Exception during HTTP request: $e");
      rethrow;
    }
  }

  Future<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'email': email,
        'password': password,
      };
      var response = await http.post(
        Uri.parse('${url}seeker/login'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 200) {
     
        isLoading.value = false;
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        Get.offAll(() => const HomePage());
        var result = jsonDecode(response.body);
        print("login success: $result");
      } else {
        isLoading.value = false;
        print("HTTP Request Failed with status code: ${response.statusCode}");
      }
      return UserModel();
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      rethrow;
    }
  }

  Future logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');

    Get.to(() => const SplashScreen());
  }

  //get user data
  Future<dynamic> getUser(String token) async {
    try {
      var user = await http.get(Uri.parse('${url}seeker/profile'),
          headers: {'Authorization': 'Bearer $token'});
      if (user.statusCode == 200 && user.body != '') {
        // var result = jsonDecode(user.body);
        // print(result);
        return user.body;
      }
    } catch (error) {
      return error;
    }
  }

  Future<void> updateUser({
    required String token,
    required String name,
    String? email,
    String? birthday,
    String? address,
    String? phone,
    File? avatar,
  }) async {
    try {
      isLoading.value = true;

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${url}seeker/profile'),
      );

      request.headers['Authorization'] = 'Bearer $token';

      // Add other fields
      request.fields['name'] = name;
      request.fields['email'] = email ?? '';
      request.fields['birthday'] = birthday ?? '';
      request.fields['address'] = address ?? '';
      request.fields['phone'] = phone ?? '';

      // Add the avatar if available
      if (avatar != null) {
        request.files.add(http.MultipartFile(
            'avatar', avatar.readAsBytes().asStream(), avatar.lengthSync(),
            filename: avatar.path.split('/').last));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        isLoading.value = false;
        var bytes = await response.stream.toBytes();
        var json = bytes != null ? utf8.decode(bytes) : null;
        if (json != null) {
          print('Data updated');
          print(json);
        } else {
          print('Error parsing response: Response body is null');
        }
      } else {
        isLoading.value = false;
        print('Response status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error parsing response: $e');
    }
  }
  
  Future<void> forgotPassword({
    required String email,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'email': email,
      };
      var response = await http.post(
        Uri.parse('${url}password/email'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        var result = jsonDecode(response.body);
        print(" success: $result");
      } else {
        isLoading.value = false;
        print("HTTP Request Failed with status code: ${response.statusCode}");
      }
    
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      rethrow;
    }
  }
}
