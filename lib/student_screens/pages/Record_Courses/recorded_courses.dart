import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro/payment_RazorPay/payment_screen.dart';
import 'package:scipro/student_screens/pages/Record_Courses/recorded_courses_Details.dart';
import 'package:scipro/widgets/button_Container.dart';

var arec_CourseID = "";

class RecordedCoursesListScreen extends StatelessWidget {
  String name = "";
  String courseid = "";

  RecordedCoursesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 44, 59),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Select your plan'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('RecordedCourses')
              .snapshots(),
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final data = snapshots.data!.docs[index].data();

                        return Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            GestureDetector(
                              onTap: () async {
                                arec_CourseID = data['CourseID'];
                                print('fectching datas${arec_CourseID}');
                                await Get.to(RecordCourseDetail(
                                  courseID: arec_CourseID,
                                ));
                              },
                              child: ButtonContainerWidget(
                                curving: 30,
                                colorindex: 0,
                                height: 200,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${data['CourseTitle']}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    Text(
                                      '${data['CourseDuration']}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      '${data['CourseFee'] + '(inc.of all taxess)'}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20.h,
                        );
                      },
                      itemCount: snapshots.data!.docs.length),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          }),
    );
  }
}
