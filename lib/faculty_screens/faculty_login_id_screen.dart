import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:scipro/faculty_screens/waiting_room.dart';
import 'package:scipro/widgets/button_Container.dart';

class FacultyLoginIdScreen extends StatefulWidget {
  const FacultyLoginIdScreen({super.key});

  @override
  State<FacultyLoginIdScreen> createState() => _FacultyLoginIdScreenState();
}

class _FacultyLoginIdScreenState extends State<FacultyLoginIdScreen> {
  @override
  void initState() {
    super.initState();
    getFacultyId();
    getPassword();
  }

  String _facultyId = "loading";
  String _password = "loading";
  TextEditingController idContoller = TextEditingController();

  TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("facaluty id and password screen section");
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            LottieBuilder.asset('assets/images/ld_password_lottie.json'),
            TextField(
              controller: idContoller,
              decoration: InputDecoration(
                  hintText: "Enter your ID",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordContoller,
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                //>>>>>>>>>>>>>>>>>Checking ID<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                CollectionReference cat =
                    FirebaseFirestore.instance.collection("FacultyProfiles");
                Query query =
                    cat.where("facultyid", isEqualTo: idContoller.text.trim());
                QuerySnapshot querySnapshot = await query.get();
                final docData =
                    querySnapshot.docs.map((doc) => doc.data()).toList();
                log(query.toString());
                log(docData.toString());
                //
                //>>>>>>>>>>>>>>>>>>>Checking password<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                CollectionReference pass =
                    FirebaseFirestore.instance.collection("FacultyProfiles");
                Query queries = pass.where("facultyPassword",
                    isEqualTo: passwordContoller.text.trim());
                QuerySnapshot querySnapshott = await queries.get();
                final docDataa =
                    querySnapshott.docs.map((doc) => doc.data()).toList();
                log(query.toString());
                log(docDataa.toString());

                // if (docData.isNotEmpty) {
                //   log("set");
                //   Get.to(StudentWaitingRoom(
                //       courseName: "JSALiveCourse", time: ""));
                // } else {
                //   final currentname =
                //       FirebaseAuth.instance.currentUser!.displayName;
                //   Get.snackbar(
                //     "${currentname}",
                //     ' You are not Subscribed',
                //     backgroundColor: Colors.red,
                //     colorText: Colors.white,
                //     messageText: Text(
                //       'You are not Subscribed',
                //       style: GoogleFonts.montserrat(
                //           color: Colors.white,
                //           fontSize: 12,
                //           fontWeight: FontWeight.w700),
                //     ),
                //   );
                //   log("error");
                // }
                if (docDataa.isNotEmpty && docData.isNotEmpty) {
                  Get.to(WaitingRoomScreen());
                  log('Correct password');
                } else {
                  log('Wrong password');
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
      ),
    );
  }

  void getFacultyId() async {
    var vari = await FirebaseFirestore.instance
        .collection("FacultyProfiles")
        .doc()
        .get();
    setState(() {
      _facultyId = vari.data()!['facultyid'];
    });
  }

  void getPassword() async {
    var vari = await FirebaseFirestore.instance
        .collection("FacultyProfiles")
        .doc()
        .get();
    setState(() {
      _password = vari.data()!['facultyPassword'];
    });
  }
}
