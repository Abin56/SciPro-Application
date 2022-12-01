import 'dart:convert';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:scipro/video_player/video_screen.dart';

import '../model_classes/v_model.dart';

class RecordedvideosPlayList extends StatefulWidget {
  const RecordedvideosPlayList({Key? key}) : super(key: key);


  @override
  State<RecordedvideosPlayList> createState() => _RecordedvideosPlayListState();
}
late DatabaseReference _videoRef;

class _RecordedvideosPlayListState extends State<RecordedvideosPlayList> {
  @override
  void initState() {
    super.initState();
    final database = FirebaseDatabase.instance;
    _videoRef = database.ref().child('Video');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text("Recorded courses",style: TextStyle(fontSize: 15,color: Colors.red),),
      ),
      body: FirebaseAnimatedList(
          query: _videoRef,
          itemBuilder: (BuildContext context,
              DataSnapshot snapshot,
              Animation<double> animation,
              int index) {
            VideoModel videoModel = VideoModel.fromJson(json.decode(json.encode(snapshot.value)));
            return GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder:(context) => VideoScreen(
                    name: videoModel.name,
                    mediaUrl: videoModel.mediaurl)));
              },
              child: Image.network(videoModel.thumbnail),);
          }
      ),
    );
  }
}
