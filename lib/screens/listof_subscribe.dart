import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro/student_screens/pages/Live_Courses/live_sub_courselist.dart';
import 'package:scipro/student_screens/recorded_sub_course_list.dart';

import '../widgets/button_Container.dart';

class UserSelectingCourselisting extends StatelessWidget {
  const UserSelectingCourselisting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(RecordedCourseListScreen());
            },
            child: ButtonContainerWidget(
              curving: 30,
              colorindex: 0,
              height: 200.h,
              width: double.infinity,
              child: Center(
                  child: Text(
                'Recorded Courses',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              )),
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          GestureDetector(
            onTap: () {
              Get.to(LiveCourseListScreen());
            },
            child: ButtonContainerWidget(
              curving: 30,
              colorindex: 0,
              height: 200.h,
              width: double.infinity,
              child: Center(
                  child: Text(
                'Live Courses',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              )),
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          GestureDetector(
            onTap: () {},
            child: ButtonContainerWidget(
              curving: 30,
              colorindex: 0,
              height: 200.h,
              width: double.infinity,
              child: Center(
                  child: Text(
                'Hybrid Courses',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
