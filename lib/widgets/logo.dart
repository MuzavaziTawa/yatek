import 'package:flutter/material.dart';

returnLogo(context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return Image.asset("assets/yatek_logo.png",
      fit: BoxFit.cover, height: screenHeight * 0.08, width: screenWidth * 0.5);
}
