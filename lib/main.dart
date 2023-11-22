import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/pages/AllBusiness_screen.dart';
import 'package:flutter_job_hiring/pages/AllJob_Screen.dart';
import 'package:flutter_job_hiring/pages/Application_screen.dart';
import 'package:flutter_job_hiring/pages/HomePage_Screen.dart';
import 'package:flutter_job_hiring/pages/abc.dart';
import 'package:flutter_job_hiring/pages/detailBusiness_screen.dart';
import 'package:flutter_job_hiring/pages/detailJob_screen.dart';
import 'package:flutter_job_hiring/pages/historyApply_screen.dart';
import 'package:flutter_job_hiring/pages/profile_screen.dart';
import 'package:flutter_job_hiring/pages/splash_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'models/auth_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthModel>(
      create: (context) => AuthModel(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Job Hiring',
        theme: ThemeData(),
        home: SplashScreen(),
      ),
    );
  }
}
