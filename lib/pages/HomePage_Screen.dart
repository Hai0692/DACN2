import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/controllers/JobController.dart';
import 'package:flutter_job_hiring/controllers/authentication.dart';
import 'package:flutter_job_hiring/pages/AllBusiness_screen.dart';
import 'package:flutter_job_hiring/pages/AllJob_Screen.dart';
import 'package:flutter_job_hiring/widgets/buttonInline.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commons/color_common.dart';
import '../controllers/businessController.dart';
import '../controllers/favoriteController.dart';
import '../providers/favorite_provider.dart';
import '../widgets/background.dart';
import '../widgets/customeBottom.dart';
import '../widgets/popolarJob.dart';
import '../widgets/topCompany.dart';
import '../widgets/searchForm.dart';
import '../widgets/seeAll.dart';
import 'detailBusiness_screen.dart';
import 'detailJob_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BusinessController _businessController = Get.put(BusinessController());
  final JobController _jobController = Get.put(JobController());
  final Authentication _authentication = Get.put(Authentication());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  var businessData;
  var popularJobData;
  var user;
  late String tokenUser;

  Future<void> getData() async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token') ?? '';

      tokenUser = token;

      final responseBusiness = await BusinessController().getBusiness();
      final responsePopularJob = await JobController().popularJob();
      if (token.isNotEmpty) {
        final responseUser = await Authentication().getUser(token);

        if (responseUser != null) {
          setState(() {
            user = json.decode(responseUser);
          });
        }
      }
      if (responseBusiness != null && responsePopularJob != null) {
        setState(() {
          businessData = jsonDecode(responseBusiness);
          popularJobData = jsonDecode(responsePopularJob);
        });
      }
    } catch (e) {
      if (e is FormatException) {
        print("FormatException: $e");
      } else {
        print("Other exception: $e");
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
        body: Stack(children: [
          const Background(),
          Positioned(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            color: ColorApp().color_black,
                          ), // Default text style
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Welcom back!\n',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            if (user == null) ...{
                              const TextSpan(
                                text: "None",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              )
                            } else ...{
                              TextSpan(
                                text: user["seeker"]["name"].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            }
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Image(
                        width: 60,
                        image: AssetImage("assets/images/logo.png"),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Search_Form(),
                  const SizedBox(height: 20),
                  See_All(
                    name: "Popular job",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllJob()));
                    },
                  ),
                  const SizedBox(height: 10),
                  if (popularJobData == null ||
                      popularJobData.length == null) ...{
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                  } else ...{
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: popularJobData.length,
                        itemBuilder: (BuildContext context, int i) {
                          return Popular_Job(
                            id: popularJobData[i]["id"],
                            company: popularJobData[i]["business"]["name"]
                                .toString(),
                            position: popularJobData[i]["position"].toString(),
                            level: popularJobData[i]["level"] is List
                                ? popularJobData[i]["level"].join(", ")
                                : popularJobData[i]["level"].toString(),
                            salary: popularJobData[i]["salary"].toString(),
                            skill: popularJobData[i]["skill"] is List
                                ? popularJobData[i]["skill"].join(", ")
                                : popularJobData[i]["level"].toString(),
                            type: popularJobData[i]["type"] is List
                                ? popularJobData[i]["type"].join(", ")
                                : popularJobData[i]["level"].toString(),
                            avatar: popularJobData[i]["business"]["avatar"],
                            location: popularJobData[i]["business"]["location"]
                                .toString(),
                            onPress: () async {
                              var jobDetailsResponse = await _jobController
                                  .jobDetails(popularJobData[i]["id"]);
                              var jobDetails = jsonDecode(jobDetailsResponse);
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailJob(data: jobDetails),
                                ),
                              );
                            },
                            onPressFavorite: () async {
                              //   final authProvider = Provider.of<AuthProvider>( context, listen: false);

                              bool isAlreadyInFavorites =
                                  favoriteProvider.isInFavorites(
                                popularJobData[i]["id"],
                              );

                              try {
                                favoriteProvider.setInFavorites(
                                    popularJobData[i]["id"],
                                    !isAlreadyInFavorites);

                                bool actionResult =
                                    await favoriteController.manageFavorite(
                                  tokenUser,
                                  popularJobData[i]["id"],
                                  isAdd: !isAlreadyInFavorites,
                                );

                                if (actionResult) {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        isAlreadyInFavorites
                                            ? 'Job removed from favorites'
                                            : 'Job added to favorites',
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Failed to update favorites'),
                                    ),
                                  );
                                }
                              } catch (e) {
                                print("Error: $e");
                                favoriteProvider.setInFavorites(
                                    popularJobData[i]["id"],
                                    isAlreadyInFavorites);
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'An error occurred. Please try again.'),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    )
                  },
                 
                  const SizedBox(height: 20),
                  See_All(
                    name: "Top Company",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllBusiness()));
                    },
                  ),
                  for (int i = 0; i < 5; i++) ...[
                    if (businessData == null)
                      ...{}
                    else ...{
                      Top_Company(
                        location: businessData[i]["location"].toString(),
                        company: businessData[i]["name"].toString(),
                        career: businessData[i]["career"].toString(),
                        avatar: businessData[i]["avatar"].toString(),
                        onPress: () async {
                          var businessDetailResponse =
                              await _businessController.BusinessDetails(
                                  businessData[i]["id"]);
                          var businessDetails =
                              jsonDecode(businessDetailResponse);
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailBusiness(data: businessDetails),
                            ),
                          );
                        },
                      ),
                    }
                  ],
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            " people are creating their CV with InDeedCV now",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(width: 20),
                        ButtonInline(text: "Create", onPress: () {}, size: 100)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar: const Custome_Bottom()
        );
  }

  ImageProvider _getImageProvider(String imageUrl) {
    // Check if the URL is a network URL
    if (imageUrl.startsWith('http') || imageUrl.startsWith('https')) {
      return NetworkImage(imageUrl);
    }
    // Assume it's a local asset path
    return NetworkImage(imageUrl);
  }

  void handleFavoriteButtonClick(
      int jobId, String tokenUser, BuildContext context) async {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    final favoriteController =
        Provider.of<FavoriteController>(context, listen: false);

    bool isAlreadyInFavorites = favoriteProvider.isInFavorites(jobId);

    try {
      favoriteProvider.setInFavorites(jobId, !isAlreadyInFavorites);

      bool actionResult = await favoriteController.manageFavorite(
        tokenUser,
        jobId,
        isAdd: !isAlreadyInFavorites,
      );

      if (actionResult) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isAlreadyInFavorites
                  ? 'Job removed from favorites'
                  : 'Job added to favorites',
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to update favorites'),
          ),
        );
      }
    } catch (e) {
      print("Error: $e");
      favoriteProvider.setInFavorites(jobId, isAlreadyInFavorites);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again.'),
        ),
      );
    }
  }
}
