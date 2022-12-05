import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro/payment_RazorPay/payment_screen.dart';
import 'package:scipro/student_screens/pages/Live_Courses/live_Course_Details.dart';
import 'package:scipro/student_screens/pages/Record_Courses/recorded_courses_Details.dart';
import 'package:scipro/widgets/button_Container.dart';

class LiveCoursesListScreen extends StatelessWidget {
  const LiveCoursesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 44, 59),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Select your plan'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(LiveCourseDetailScreen());
                      },
                      child: ButtonContainerWidget(
                        curving: 30,
                        colorindex: index,
                        height: 200,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              listofRecordedCourses[index],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              listofRecordedPrices[index],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
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
              itemCount: 3),
        ),
      ),
    );
  }
}

List listofRecordedCourses = [
  'Junior Lab Assistant \n 3 Months',
  'Junior Scientific Assistant \n 3 Months',
  'Junior Scientific Assistant\n 3 Months'
];
List listofRecordedPrices = [
  '3499.0(inc.of all taxess)',
  '3499.0(inc.of all taxess)',
  '3499.0(inc.of all taxess)',
];
