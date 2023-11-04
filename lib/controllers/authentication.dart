import 'dart:convert';
import 'package:flutter/material.dart';
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

  Future registerUser({
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
        Get.to(() => const LoginPage());
        var result = jsonDecode(response.body);
        print("register success: $result");
      }
      if (response.statusCode == 500) {
        print("Server Error: ${response.body}");
      } else {
        isLoading.value = false;

        print("HTTP Request Failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future logoutUser({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    try {
      var data = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('${url}seeker/logout'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        isLoading.value = false;
        token.value = json.decode(response.body)['token'];
        box.remove(token.value);
        var result = jsonDecode(response.body);
        Get.offAll(() => const SplashScreen());
        print("logout success: $result");
      } else if (response.statusCode == 401) {
        // Handle unauthorized error (token invalid)
        isLoading.value = false;
        // You can display an error message or navigate to a login page here
        print("Unauthorized: Token invalid");
      } else {
        isLoading.value = false;
        print("HTTP Request Failed with status code: ${response.statusCode}");
        // Handle other errors here
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      // Handle network or other exceptions here
    }
  }

  Future loginUser({
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
      print(json.decode(response.body));
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}

  //  //get user data
  // Future<dynamic> getUser(String token) async {
  //   try {
  //     var user = await http.get(
  //         Uri.parse('${url}user/profile'),
  //         headers: {'Authorization': 'Bearer $token'});
  //     if(user.statusCode == 200 && user.body !=''){
  //       return user.body;
  //     }
  //   }catch (error) {
  //     return error;
  //   }
  // }

