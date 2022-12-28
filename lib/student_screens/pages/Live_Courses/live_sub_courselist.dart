// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro/model/live_class_model.dart';
import 'package:scipro/screens/hybrid_courses.dart';
import 'package:scipro/student_screens/Student_waiting_room.dart';
import 'package:scipro/student_screens/pages/Live_Courses/live_Courses_list.dart';
import 'package:scipro/student_screens/pages/Record_Courses/recorded_courses.dart';
import 'package:scipro/student_screens/pages/faculties.dart';
import 'package:scipro/student_screens/pages/live_Mock_test.dart';
import 'package:scipro/student_screens/pages/study_materials_screen.dart';
import 'package:scipro/widgets/button_Container.dart';

class LiveCourseListScreen extends StatefulWidget {
  String courseID = '';

  LiveCourseListScreen({super.key});

  @override
  State<LiveCourseListScreen> createState() => _LiveCourseListScreenState();
}

class _LiveCourseListScreenState extends State<LiveCourseListScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Courses'),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("LiveCoursePaymentModel_live")
                  .snapshots(),
              builder: (context, snapshots) {
                return (snapshots.connectionState == ConnectionState.waiting)
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : ListView.separated(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = LiveCoursePaymentModel.fromJson(
                              snapshots.data!.docs[index].data());

                          if (snapshots.hasData) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(StudentWaitingRoom(
                                    id: data.id,
                                    roomID: data.roomID,
                                    courseName: data.courseName,
                                    time: data.courseTime));
                              },
                              child: ButtonContainerWidget(
                                curving: 30,
                                colorindex: 0,
                                height: 80.h,
                                width: double.infinity,
                                child: Center(
                                    child: Text(
                                  data.courseName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18),
                                )),
                              ),
                            );
                          } else {
                            return const Text('');
                          }
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                      );
              },
            )),
      ),
    );
  }
}

List screens = [
  RecordedCoursesListScreen(),
  LiveCoursesListScreen(),
  const HybridCourses(),
  const FacultieScreen(),
  const StudyMaterialsScreen(),
  const LiveMockTestsScreen()
];
