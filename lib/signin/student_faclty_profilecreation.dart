import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:scipro/faculty_screens/faculty_home_screen.dart';
import 'package:scipro/faculty_screens/uploadImagetoFirebase.dart';

class StudentandFacultyCreationPage extends StatelessWidget {
  const StudentandFacultyCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              const Text(
                'To',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/SCIPRO.png'))),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Get.to(GoogleSiginController());
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'CREATE STUDENT PROFILE',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 65, 118, 225),
                    fixedSize: const Size(400, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              SizedBox(height: 27),
              ElevatedButton(
                onPressed: () {
                  Get.off(UploadImageScreenToOffer());
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'CREATE FACLTY PROFILE',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Color.fromARGB(255, 245, 79, 24),
                    fixedSize: const Size(400, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
