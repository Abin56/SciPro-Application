import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:scipro/faculty_screens/sample.dart';
import 'package:scipro/widgets/button_Container.dart';

class FacultyLoginIdScreen extends StatefulWidget {
  FacultyLoginIdScreen({super.key});

  @override
  State<FacultyLoginIdScreen> createState() => _FacultyLoginIdScreenState();
}

class _FacultyLoginIdScreenState extends State<FacultyLoginIdScreen> {
  @override
  void initState() {
    super.initState();
    getFacultyId();
    getPassword();
  }

  String _facultyId = "loading";
  String _password = "loading";
  TextEditingController idContoller = TextEditingController();

  TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("facaluty id and password screen section");
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            LottieBuilder.asset('assets/images/ld_password_lottie.json'),
            TextField(
              controller: idContoller,
              decoration: InputDecoration(
                  hintText: "Enter your ID",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            TextField(
              controller: passwordContoller,
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            GestureDetector(
              onTap: () async {
                if (idContoller.text.trim() == _facultyId &&
                    passwordContoller.text.trim() == _password) {
                  Get.offAll(SamplePage());
                } else {
                  log('Wrong password');
                }
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 60,
                width: 200,
                child: const Center(
                  child: Text(
                    "Enter",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getFacultyId() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("Admin")
        .doc("facultyCredential")
        .get();
    setState(() {
      _facultyId = vari.data()!['FacultyID'];
    });
  }

  void getPassword() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("Admin")
        .doc("facultyCredential")
        .get();
    setState(() {
      _password = vari.data()!['Password'];
    });
  }
}
