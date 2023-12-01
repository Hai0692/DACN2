import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/pages/splash_screen.dart';
import 'package:flutter_job_hiring/providers/auth_provider.dart';
import 'package:flutter_job_hiring/providers/favorite_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  _loadPreferences();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
        ChangeNotifierProvider<FavoriteProvider>(create: (context) => FavoriteProvider(),
        ),
      ],
      child: GetMaterialApp(
      
        debugShowCheckedModeBanner: false,
        title: 'Flutter Job Hiring',
        theme: ThemeData(),
        home: const SplashScreen(),
      ),
     
    );
  }
}
