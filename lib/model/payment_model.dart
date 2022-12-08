//     final UserPaymentModel = UserPaymentModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scipro/screens/home_screen.dart';

UserPaymentModel UserPaymentModelFromJson(String str) =>
    UserPaymentModel.fromJson(json.decode(str));

String UserPaymentModelToJson(UserPaymentModel data) =>
    json.encode(data.toJson());

class UserPaymentModel {
  UserPaymentModel({
    required this.useremail,
    required this.userName,
    required this.courseid,
    required this.uid,
    required this.courseName,
  });
  String userName;

  String useremail;
  String courseid;
  String uid;
  String courseName;

  factory UserPaymentModel.fromJson(Map<String, dynamic> json) =>
      UserPaymentModel(
        useremail: json["useremail"] ?? '',
        userName: json["userName"] ?? '',
        courseid: json["courseid"] ?? '',
        uid: json["uid"] ?? '',
        courseName: json["courseName"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "useremail": useremail,
        "userName": userName,
        "courseid": courseid,
        "uid": uid,
        "courseName": courseName,
      };
}

class UserAddressAddToFireBase {
  final currentUser = FirebaseAuth.instance.currentUser!.uid;
  Future addUserPaymentModelController(
    UserPaymentModel productModel,
  ) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("UserPaymentModel")
          .doc(currentUser)
          .set(productModel.toJson())
          .then((value) => Get.to(HomeScreen()));
    } on FirebaseException catch (e) {
      // log('Error ${e.message.toString()}');
    }
  }
}
