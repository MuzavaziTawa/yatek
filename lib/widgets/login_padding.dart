import 'package:flutter/material.dart';

returnPadding(context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return Padding(padding: EdgeInsets.only(top: screenHeight * 0.05));
}
