import 'package:flutter/material.dart';

class IconMedia extends StatefulWidget {
  final String image;
  const IconMedia({super.key, required this.image});

  @override
  State<IconMedia> createState() => _IconMediaState();
}

class _IconMediaState extends State<IconMedia> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Image.asset(widget.image, width: 26, height: 26),
      ),
    );
  }
}
//"assets/icons/facebook_ic.png"
