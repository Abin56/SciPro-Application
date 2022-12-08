import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scipro/faculty_screens/faculty_login_id_screen.dart';
import 'package:scipro/screens/home_screen.dart';
import 'package:scipro/widgets/button_Container.dart';
import 'package:scipro/widgets/newMorphism.dart';

import 'login_previous_students.dart';

class StudentandFacultyLoginScreen extends StatelessWidget {
  StudentandFacultyLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 44, 59),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonContainerWidget(
            curving: 30,
            colorindex: 0,
            height: 220,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Login \n   as",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Image.asset(
                      'assets/images/SCIPRO.png',
                      height: 50,
                      width: 100,
                    ),
                  ),
                  Text(
                    " Student",
                    style: GoogleFonts.montserrat(
                        color: Color.fromARGB(255, 1, 2, 0),
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  )
                ]),
                GestureDetector(
                  onTap: () {
                    Get.to(HomeScreen());
                  },
                  child: ButtonContainerWidget(
                      curving: 30,
                      colorindex: 4,
                      height: 46.h,
                      width: 180.w,
                      child: Center(
                        child: Text(
                          'Go ',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                )
              ],
            ),
          ),
          ButtonContainerWidget(
            curving: 30,
            colorindex: 0,
            height: 220,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Login \n   as",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Image.asset(
                      'assets/images/SCIPRO.png',
                      height: 50,
                      width: 100,
                    ),
                  ),
                  Text(
                    " Faculty",
                    style: GoogleFonts.montserrat(
                        color: Color.fromARGB(255, 30, 10, 85),
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  )
                ]),
                GestureDetector(
                  onTap: () {
                    Get.to(FacultyLoginIdScreen());
                  },
                  child: ButtonContainerWidget(
                      curving: 30,
                      colorindex: 4,
                      height: 46.h,
                      width: 180.w,
                      child: Center(
                        child: Text(
                          'Go ',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                )
              ],
            ),
          ),
          ButtonContainerWidget(
            curving: 30,
            colorindex: 0,
            height: 220,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Login \n   as",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Image.asset(
                      'assets/images/SCIPRO.png',
                      height: 50,
                      width: 100,
                    ),
                  ),
                  Text(
                    " Pervious Students",
                    style: GoogleFonts.montserrat(
                        color: Color.fromARGB(255, 30, 10, 85),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                ]),
                GestureDetector(
                  onTap: () {
                    Get.to(PreviousStudentCourseList());
                  },
                  child: ButtonContainerWidget(
                      curving: 30,
                      colorindex: 4,
                      height: 46.h,
                      width: 180.w,
                      child: Center(
                        child: Text(
                          'Go ',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
