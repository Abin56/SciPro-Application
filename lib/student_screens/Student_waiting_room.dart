import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scipro/screens/live_classroom.dart';
import 'package:scipro/utils/responsive.dart';

class StudentWaitingRoom extends StatefulWidget {
  const StudentWaitingRoom({Key? key}) : super(key: key);

  @override
  State<StudentWaitingRoom> createState() => _StudentWaitingRoomState();
}

class _StudentWaitingRoomState extends State<StudentWaitingRoom> {
  late final dref = FirebaseDatabase.instance.ref();
  late DatabaseReference databaseReference;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseReference = dref.child("course");
  }

  @override
  Widget build(BuildContext context) {
    var a ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Waiting Room",
          style: TextStyle(
              color: Colors.limeAccent,
              fontSize: 15
          ),),
      ),
      body: Column(
        children: [
          Container(
            child:
            Column(
              children: [
                Text("Course Name"),
                Text("Course Duration"),
                Text("Course Time")
              ],
            ),
          ),
          SizedBox(height: 40,),
           StreamBuilder(
              stream: databaseReference.child("courseA").onValue,
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator(color: Colors.red);
                return Column(
                  children: [
                    if (snapshot.data!.snapshot.value["start"].toString() == "b")
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LiveClassRoom()));
                },
                        child:
                      Container(
                        height:50,
                          width:100,
                          color:Colors.green,
                          child:
                          Text('Enter')),),
                    Text('Wait Your teacher is prapring the class room'),


                  ],
                );
              },
            ),
    ]
    )
    );
  }
}

