import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scipro/payment_RazorPay/payment_screen.dart';
import 'package:scipro/widgets/button_Container.dart';

class LiveCourseDetailScreen extends StatelessWidget {
  const LiveCourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 44, 59),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: ButtonContainerWidget(
                    curving: 10,
                    colorindex: 0,
                    height: 40.h,
                    width: 40.w,
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  "Course Details",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            ButtonContainerWidget(
              curving: 30,
              colorindex: 0,
              height: 500.h,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SciPro Recorded Course Details',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Text('Junior Lab Assistant Course Details'),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Course Title :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Junior Lab Assistant',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Course SubTitle :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'SCIJLARS',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Faculty :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Dr.Diya P S',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Course Fee :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '3499.00',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Duration :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '3 Months',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Course ID :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'SCIJLARS',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Posted Date :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '17 November,2022',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Posted Time :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '09:53:44 AM',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Current Video Number :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '5',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () async {
                log('Going to checkout screen');
                Get.to(CheckOutScreen(totalPrice: 3999.00, addressID: ''));
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 4,
                height: 60.h,
                width: 200.w,
                child: Center(
                  child: Text(
                    " 🔔 Subscribe ",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
