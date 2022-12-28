import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scipro/faculty_screens/new_waiting_room.dart';
import 'package:scipro/faculty_screens/waiting_room.dart';

import '../widgets/button_Container.dart';

class RoomIDandPassWord extends StatelessWidget {
  String facultyId;
  String password;
  bool onpressed;
  String id;
  TextEditingController idContoller = TextEditingController();

  TextEditingController passwordContoller = TextEditingController();
  RoomIDandPassWord(
      {required this.onpressed,
      required this.facultyId,
      required this.id,
      required this.password,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: idContoller,
              decoration: InputDecoration(
                  hintText: "Enter your ID",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordContoller,
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // Get.to(NewWaitingRoomScreen(
                //   id: id,
                // ));

                if (idContoller.text.trim() == facultyId &&
                    passwordContoller.text.trim() == password) {
                  Get.to(NewWaitingRoomScreen(
                    id: id,
                  ));
                } else {
                  Get.snackbar("Alert", '',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      messageText: Text(
                        'Wrong Password',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ));
                }
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 60,
                width: 200,
                child: const Center(
                  child: Text(
                    "Enter",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
