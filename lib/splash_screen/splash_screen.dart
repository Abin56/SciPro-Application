import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:path_provider/path_provider.dart';
import 'package:scipro/signin/g_signin.dart';

import '../screens/home_screen.dart';
import '../signin/student_faculty_login_screen.dart';
import 'on_boarding.dart';

class Splashscreen extends StatelessWidget {
// final examplecontoler = Get.find<StateGetx>()
  Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GoHomeScreen(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset("assets/images/SCIPRO.png"),
      ),
    );
  }

  // ignore: non_constant_identifier_names

}

GoHomeScreen(context) async {
  await Future.delayed(const Duration(seconds: 3));
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => StudentandFacultyLoginScreen()));
}
