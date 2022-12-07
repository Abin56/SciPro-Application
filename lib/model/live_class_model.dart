//     final LiveCoursePaymentModel = LiveCoursePaymentModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scipro/screens/home_screen.dart';

LiveCoursePaymentModel LiveCoursePaymentModelFromJson(String str) =>
    LiveCoursePaymentModel.fromJson(json.decode(str));

String LiveCoursePaymentModelToJson(LiveCoursePaymentModel data) =>
    json.encode(data.toJson());

class LiveCoursePaymentModel {
  LiveCoursePaymentModel({
    required this.courseid,
    required this.uid,
    required this.courseName,
  });

  String courseid;
  String uid;
  String courseName;

  factory LiveCoursePaymentModel.fromJson(Map<String, dynamic> json) =>
      LiveCoursePaymentModel(
        courseid: json["courseid"] ?? '',
        uid: json["uid"] ?? '',
        courseName: json["courseName"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "courseid": courseid,
        "uid": uid,
        "courseName": courseName,
      };
}

class LivePaymentStatusAddToFireBase {



  final currentUser = FirebaseAuth.instance.currentUser!.uid;
  Future livePaymentModelController(LiveCoursePaymentModel productModel,String randomNumner) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("LiveCoursePaymentModel_live")
          .doc(randomNumner)
          .set(productModel.toJson())
          .then((value) => Get.to(HomeScreen()));
    } on FirebaseException catch (e) {
      // log('Error ${e.message.toString()}');
    }
  }
}
