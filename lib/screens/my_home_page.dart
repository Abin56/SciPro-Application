import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro/main_scroll_screens/current_course_slider.dart';
import 'package:scipro/main_scroll_screens/current_courses_mainpage.dart';
import 'package:scipro/main_scroll_screens/industry_oriented_final.dart';
import 'package:scipro/main_scroll_screens/our_popular_courses.dart';
import 'package:scipro/student_screens/student_course_list.dart';
import 'package:scipro/utils/explore_drawer.dart';

import '../methods/auth_methods.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthMethods _authMethods = AuthMethods();
  //late TextEditingController nameController;
  late String nameController;

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;
  int _current = 0;
  int _currentIndex = 0;
  int _sub = 0;

  final List<String> imagesList = [
    'assets/divya.png',
    'assets/gokul.png',
    'assets/praveena.png',
    'assets/rekha.png',
    'assets/sunil.png',
  ];
  final List<String> titles = [
    'Dr. Divya P.S',
    'Gokul S',
    'Praveena T.P',
    'Dr. Rekha Mol K.R',
    'Sunil P'
  ];
  final List<String> subtitles = [
    'Microbiologist',
    'Technologist',
    'Physicist',
    'Biotechnologist',
    'IT Security Consultant',
  ];
  final List<String> courseImagesList = [
    'assets/images/12.png',
    'assets/images/13.png',
    'assets/images/14.png',
    'assets/images/15.jpg',
  ];

  List<Widget> generateImagesTiles() {
    return imagesList
        .map((element) => ClipRRect(
              child: Image.asset(
                element,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ))
        .toList();
  }

  List<Widget> generateCoursesImagesTiles() {
    return courseImagesList
        .map((element) => ClipRRect(
              child: Image.asset(
                element,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ))
        .toList();
  }

  _scrollListner() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListner);
    nameController = _authMethods.user.displayName!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      drawer: const ExploreDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
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
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/images/SCIPRO.png",
                            width: 100,
                            height: 120,
                          ),
                          const Text(
                            "The Science Professional",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            "Hi ",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            nameController,
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "!",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                        text: 'Start your journy',
                        onPressed: () async {
                          Get.to(StudentCourseListScreen());
                        }),
                  ],
                ),
              ),
            ]),
            CurrentCourseSlider(),
            SizedBox(
              height: 50.h,
            ),
            OurPopularCourses(),
            CurrentCoursesMainPage()
          ],
        ),
      ),
    );
  }
}
