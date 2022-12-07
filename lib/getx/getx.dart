// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// import '../model/payment_model.dart';

// class PaymentController extends GetxController {
//   List<UserPaymentModel> list1 = [];
//   RxBool isLoading = false.obs;
//   List<Map<String, dynamic>> categoryCollections = [];
//   Future<List<UserPaymentModel>> fetchingAddress() async {
//     List<Map<String, dynamic>> list = [];
//     final data =
//         await FirebaseFirestore.instance.collection("UserPaymentModel").get();
//     final d =
//         data.docs.map((e) => UserPaymentModel.fromJson(e.data())).toList();
//     return d;
//   }

//   @override
//   void onInit() {
//     fetchingAddress().then((value) {
//       isLoading.value = false;
//       list1 = value;
//     });
//     super.onInit();
//   }
// }
