import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../faculty_screens/faculty_home_screen.dart';
import '../methods/auth_methods.dart';
import '../student_screens/student_home_screen.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';

class StudentFacultyLoginScreen extends StatefulWidget {
  const StudentFacultyLoginScreen({Key? key}) : super(key: key);

  @override
  State<StudentFacultyLoginScreen> createState() =>
      _StudentFacultyLoginScreenState();
}

class _StudentFacultyLoginScreenState extends State<StudentFacultyLoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              gradient: LinearGradient(
                colors: [
                  AppColor.gradientFirst.withOpacity(0.9),
                  AppColor.gradientSecond
                ],
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight,
              )),
          child: Column(
            children: [
              const Text(
                "Login \n   as",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Image.asset(
                      'assets/SCIPRO.png',
                      height: 50,
                      width: 100,
                    ),
                  ),
                  const Text(
                    "Student",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: CustomButton(
                    text: 'Go',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentHomeScreen()),
                      );
                    }),
              )
            ],
          )),
      const SizedBox(
        height: 10,
      ),
      Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              gradient: LinearGradient(
                colors: [
                  AppColor.gradientFirst.withOpacity(0.9),
                  AppColor.gradientSecond
                ],
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight,
              )),
          child: Column(
            children: [
              const Text(
                "Login \n   as",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Image.asset(
                      'assets/SCIPRO.png',
                      height: 50,
                      width: 100,
                    ),
                  ),
                  const Text(
                    "Faculty",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: CustomButton(
                    text: 'Go',
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const FacultyHomeScreen()),
                      // );
                    }),
              )
            ],
          )),
    ]));
  }
}
