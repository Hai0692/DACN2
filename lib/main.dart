import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/pages/AllJob_Screen.dart';
import 'package:flutter_job_hiring/pages/HomePage_Screen.dart';
import 'package:flutter_job_hiring/pages/OTPverify_screen.dart';
import 'package:flutter_job_hiring/pages/forgot_password_screen.dart';
import 'package:flutter_job_hiring/pages/login_screen.dart';
import 'package:flutter_job_hiring/pages/new_password_screen.dart';
import 'package:flutter_job_hiring/pages/register_screen.dart';
import 'package:flutter_job_hiring/pages/splash_screen.dart';
import 'package:flutter_job_hiring/pages/success_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Job Hiring',
      theme: ThemeData(),
      home: const AllJob(),
    );
  }
}
