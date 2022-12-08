import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scipro/signin/sample.dart';
import 'package:scipro/widgets/button_Container.dart';

import '../model/paid_model.dart';

class PreviousStudentCourseList extends StatelessWidget {
  PreviousStudentCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select your Course'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                final currentUser =
                    FirebaseAuth.instance.currentUser!.displayName;
                log('UserEmailidrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${currentUser}');
                if (jSALiveStudents.contains(currentUser)) {
                  log('Correct');
                  Get.to(Sample());
                } else {
                  Get.snackbar(
                    "${currentUser}",
                    ' You are not Subscribed',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    messageText: Text(
                      'You are not Subscribed',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  );
                }
              },
              child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 150,
                  width: double.infinity,
                  child: Center(
                    child: Text('JSA Live Course',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                final currentUser =
                    FirebaseAuth.instance.currentUser!.displayName;
                log('UserEmailidrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${currentUser}');
                if (jSARecordedStudents.contains(currentUser)) {
                  log('Correct');
                  Get.to(Sample());
                } else {
                  final currentUser = FirebaseAuth.instance.currentUser!.email;
                  Get.snackbar(
                    "${currentUser}",
                    ' You are not Subscribed',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    messageText: Text(
                      'You are not Subscribed',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  );
                }
              },
              child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 150,
                  width: double.infinity,
                  child: Center(
                    child: Text('JSA Recorded Course',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                final currentUser =
                    FirebaseAuth.instance.currentUser!.displayName;
                log('UserEmailidrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${currentUser}');
                if (jLALiveStudents.contains(currentUser)) {
                  log('Correct');
                  Get.to(Sample());
                } else {
                  Get.snackbar(
                    "${currentUser}",
                    ' You are not Subscribed',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    messageText: Text(
                      'You are not Subscribed',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  );
                }
              },
              child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 150,
                  width: double.infinity,
                  child: Center(
                    child: Text('JLA Live Course',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                final currentUser =
                    FirebaseAuth.instance.currentUser!.displayName;
                log('UserEmailidrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${currentUser}');
                if (jLARecordedClass.contains(currentUser)) {
                  log('Correct');
                  Get.to(Sample());
                } else {
                  Get.snackbar(
                    "${currentUser}",
                    ' You are not Subscribed',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    messageText: Text(
                      'You are not Subscribed',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  );
                }
              },
              child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 150,
                  width: double.infinity,
                  child: Center(
                    child: Text('JLA Recorded Course',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
// Future<dynamic> deleteCategory({required context, required id}) async {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: const Text("Alert"),
//         content: const Text(
//           "Are You Sure to delete the Category ?",
//           style: TextStyle(fontSize: 18),
//         ),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: const Text("Cancel")),
//           TextButton(
//               onPressed: () async {
//                 log(id);
//                 homeController.delteCategoryformFireBase(id).then((value) {
//                   Get.back();
//                   Get.snackbar("Message", 'Deleted',
//                       backgroundColor: Colors.red, colorText: Colors.white);
//                 });
//               },
//               child: const Text("Ok")),
//         ],
//       );
//     },
//   );
// }
