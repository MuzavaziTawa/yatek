import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget emailField(context, controller) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return Container(
    height: screenHeight * 0.09,
    width: screenWidth * 0.9,
    margin: const EdgeInsets.only(top: 5),
    padding: const EdgeInsets.only(top: 15, bottom: 10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(1)),
    child: TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      cursorWidth: 1,
      maxLength: 200,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      cursorColor: Colors.black,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: screenWidth * 0.042,
      ),
      decoration: const InputDecoration(
        filled: true,
        hintText: 'Please enter your email address',
        counterText: "",
        fillColor: Colors.white,
        border: InputBorder.none,
      ),
    ),
  );
}

Widget passwordField(context, controller) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return Container(
    height: screenHeight * 0.09,
    width: screenWidth * 0.9,
    margin: const EdgeInsets.only(top: 5),
    padding: const EdgeInsets.only(top: 15, bottom: 10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(1)),
    child: TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      obscureText: true,
      obscuringCharacter: "*",
      controller: controller,
      cursorWidth: 1,
      maxLength: 200,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      cursorColor: Colors.black,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: screenWidth * 0.042,
      ),
      decoration: const InputDecoration(
        filled: true,
        hintText: 'Please enter your password',
        counterText: "",
        fillColor: Colors.white,
        border: InputBorder.none,
      ),
    ),
  );
}
