import 'package:flutter/material.dart';
import 'package:scipro/screens/hybrid_courses.dart';
import 'package:scipro/screens/live_classroom.dart';
import 'package:scipro/screens/my_home_page.dart';
import 'package:scipro/student_screens/pages/Live_Courses/live_Courses_list.dart';
import 'package:scipro/student_screens/pages/Record_Courses/recorded_courses.dart';
import 'package:scipro/utils/menudriven.dart';
import 'package:scipro/video_player/videoplayer_firebase.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  //static VideoPlayerController get controller => (controller);
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MyHomePage(),
    RecordedCoursesListScreen(),
    LiveCoursesListScreen(),

    //  RecordedvideosPlayList(),
    const LiveClassRoom(),
    const HybridCourses()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SCIPRO"),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.gradientFirst,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        type: BottomNavigationBarType.fixed,
        currentIndex: _page,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'SciPRO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Recorded Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'Live Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Hybrid Courses',
          ),
        ],
      ),
      drawer: NavDrawer(),
    );
  }
}
