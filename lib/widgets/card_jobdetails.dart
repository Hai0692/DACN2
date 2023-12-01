import 'package:flutter/material.dart';
import 'package:flutter_job_hiring/providers/favorite_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../commons/color_common.dart';

class detailJob extends StatelessWidget {
  final int id;
  final String position;
  final String company;
  final String level;
  final String skill;
  final String type;
  final String location;
  final String salary;
  final String avatar;
  final VoidCallback onPress;
  final VoidCallback? onPressFavorite;
 
  const detailJob({
    super.key,
   required this.id,
    required this.position,
    required this.company,
    required this.level,
    required this.skill,
    required this.type,
    required this.location,
    required this.salary,
    required this.avatar,
    required this.onPress,
    this.onPressFavorite,
   
  });

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final bool isInFavorites = favoriteProvider.isInFavorites(id);
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.maxFinite,
        //  height: 170,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: ColorApp().color_black.withAlpha(20),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 3))
          ],
        ),
        child: Column(children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 20),
                //    height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      HexColor("#6BCB7A"),
                      HexColor("#6BCB7A").withAlpha(80),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            avatar,
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          //    const SizedBox(width: 20),
                          SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  position,
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  company,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                      
                           isInFavorites ? Icons.favorite : Icons.favorite_border_outlined,
                              color: HexColor("#F54209"),
                              size: 15,
                            ),
                            onPressed: onPressFavorite ?? () {},
                          ),
                        ]),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              skill,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              level,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              type,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.locationDot,
                          color: Colors.green,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          location,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: ColorApp().color_green,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text(
                      salary,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: ColorApp().color_green,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
