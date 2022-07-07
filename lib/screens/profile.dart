import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:yatek/screens/progress.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var filepath = "";
  DateTime dob = DateTime.now();

  onPickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    if (result != null) {
      setState(() {
        filepath = result.files.single.name;
      });
    }
  }

  onSelectDate(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2025),
    );
    if (datePicked != null) {
      setState(() {
        dob = datePicked;
      });
    }
  }

  onSaveProfile() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Progress()));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Material(
        child: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("Profile"),
        GestureDetector(
          onTap: () => onPickImage(),
          child: AnimatedContainer(
            height: screenHeight * 0.1,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(7.0),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: filepath == ""
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add Profile Photo",
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.blue,
                        size: screenWidth * 0.035,
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      Image.file(
                        File(filepath),
                      ),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              filepath = "";
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        InkWell(
            onTap: () {
              onSaveProfile();
            },
            child: Container(
              width: screenWidth * 0.6,
              height: screenHeight * 0.08,
              color: Colors.blue[900],
              alignment: Alignment.center,
              child: Text(
                "Save Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold),
              ),
            ))
      ]),
    ));
  }
}
