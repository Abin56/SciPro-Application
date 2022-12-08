import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro/faculty_screens/faculty_login_id_screen.dart';
import 'package:scipro/screens/home_screen.dart';
import 'package:scipro/signin/student_faculty_login_screen.dart';
import 'package:scipro/widgets/button_Container.dart';

class StudentProfleCreation extends StatefulWidget {
 
  String imagePath;
  String? name, place, subject, email, mobilrnumber, imageUrl;
  StudentProfleCreation(
      {Key? key,

      required this.imagePath,
      this.name,
      this.place,
      this.subject,
      this.imageUrl,
      this.mobilrnumber,
      this.email})
      : super(key: key);

  @override
  _FacultyHomePageState createState() => _FacultyHomePageState();
}

class _FacultyHomePageState extends State<StudentProfleCreation> {
  double _opacity = 0;
  final double _scrollPosition = 0;
  var loginUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var loginUser = FirebaseAuth.instance.currentUser;
    String user = loginUser.toString();
    double width = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    TextEditingController name = TextEditingController();
    TextEditingController place = TextEditingController();
    TextEditingController subject = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController mobilenumber = TextEditingController();
    bool payment = false;

    final userId = FirebaseAuth.instance.currentUser!.uid;

    CollectionReference ref =
        FirebaseFirestore.instance.collection('StudentsProfile');

    double progress = 0.0;

    uploadFile() async {
      final User? user = FirebaseAuth.instance.currentUser;
      var imageFile =
          FirebaseStorage.instance.ref().child(userId).child("/.jpg");
      // UploadTask task = imageFile.putFile(file!);
      //TaskSnapshot snapshot = await task;
      //imageUrl = await snapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('StudentsProfile')
          .doc(userId)
          .set(({
            "imageUrl": widget.imagePath,
            'name': name.text,
            'place': place.text,
            'subject': subject.text,
            'email': email.text,
            'mobilenumber': mobilenumber.text,
          }));
      //print(url);
    }

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Create Student Profile '),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          CircleAvatar(
            radius: 130,
            backgroundImage: NetworkImage(widget.imagePath),
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            height: 450.h,
            child: Column(
              children: [
                TextField(
                  controller: name,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                      hintText: "Student Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  controller: place,
                  decoration: InputDecoration(
                      hintText: "Place",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  controller: subject,
                  decoration: InputDecoration(
                      hintText: "Subject",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  controller: mobilenumber,
                  decoration: InputDecoration(
                      hintText: "Mobile Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                    onTap: () {
                      //uploadFile();
                      ref.doc(userId).set({
                        'imageUrl': widget.imagePath,
                        'Name': name.text,
                        'place': place.text,
                        'subject': subject.text,
                        'email': email.text,
                        'mobilenumber': mobilenumber.text,
                      }).whenComplete(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StudentandFacultyLoginScreen(
                                    
                                    )));
                      });
                    },
                    child: ButtonContainerWidget(
                      curving: 30,
                      colorindex: 4,
                      height: 60,
                      width: 200,
                      child: const Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
