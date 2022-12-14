import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PixelsController extends GetxController {
  double checkoutPrice =0;
  double coupenvalue = 5000;
  double newValue = 0;
  double totalAmount = 0;
  final count = 0.obs;
  List<Map<String, dynamic>> list1 = [];
  List<Map<String, dynamic>> categoryCollections = [];

  @override
  void onInit() {


    super.onInit();
  }



  int currentIndex = 0;
  currentindex(int index) {
    currentIndex = index;
    update();
  }


    // final countryCodee = countrycode.text = '  +91';




}
