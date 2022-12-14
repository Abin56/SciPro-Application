// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:scipro/getx/getx.dart';
// import 'package:scipro/student_screens/pages/Live_Courses/live_Courses_list.dart';

// import '../screens/drawer/drawer.dart';
// import '../screens/hybrid_courses.dart';
// import '../screens/live_classroom.dart';
// import '../screens/my_home_page.dart';
// import '../student_screens/pages/Record_Courses/recorded_courses.dart';

// final getcontroller = Get.put(PixelsController());

// class NavigationBarContoller extends StatelessWidget {
//   const NavigationBarContoller({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PixelsController>(
//         init: getcontroller,
//         builder: (_) {
//           return Scaffold(
//             extendBody: true,
//             // backgroundColor: Colors.red,
//             body: screens[getcontroller.currentIndex],
//             bottomNavigationBar: Container(
//               height: 73,
//               decoration: BoxDecoration(
//                 // color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 border: Border.all(color: Colors.white.withOpacity(0.13)),
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color.fromARGB(255, 6, 71, 157),
//                     Color.fromARGB(255, 5, 85, 222)
//                   ],
//                 ),
//               ),
//               child: GNav(
//                 // tabBackgroundGradient: LinearGradient(
//                 //   colors: glassmorphism[0],
//                 //   begin: Alignment.centerLeft,
//                 //   end: Alignment.centerRight,
//                 // ),
//                 // backgroundColor: Colors.amber,
//                 // curve: Curves.easeOutExpo,
//                 // haptic: true,
//                 gap: 8,
//                 rippleColor: Colors.grey,
//                 // hoverColor: Colors.amber,
//                 activeColor: Colors.white,
//                 // duration: Duration(microseconds: 300),
//                 // tabBackgroundColor: Colors.red,
//                 color: Colors.white,
//                 tabs: const [
//                   GButton(
//                       iconSize: 20,
//                       icon: LineIcons.home,
//                       text: 'Home',
//                       style: GnavStyle.google),
//                   GButton(
//                     iconSize: 20,
//                     textSize: 9,
//                     icon: Icons.fiber_smart_record_outlined,
//                     text: 'ReC_Courses',
//                   ),
//                   GButton(
//                     iconSize: 20,
//                     // iconSize: 10,
//                     textSize: 12,
//                     icon: Icons.live_tv,
//                     text: 'Live Courses',
//                   ),
//                   GButton(
//                     iconSize: 20,
//                     icon: LineIcons.user,
//                     text: 'Profile',
//                   )
//                 ],
//                 selectedIndex: getcontroller.currentIndex,
//                 onTabChange: (value) {
//                   getcontroller.currentindex(value);
//                 },
//               ),
//             ),
//             drawer: Drawer(
//               backgroundColor: const Color.fromARGB(255, 39, 29, 41),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const MyHeaderDrawer(),
//                     MyDrawerList(context),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
  
// }

// var screens = [
//   MyHomePage(),
//   RecordedCoursesListScreen(),
//   LiveCoursesListScreen(),
//   // LiveClassRoom(roomID: ''),
//   const HybridCourses()
// ];

// class GlassBox extends StatelessWidget {
//   // ignore: prefer_typing_uninitialized_variables
//   final child;
//   const GlassBox({required this.child, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: Container(
//         height: 100,
//         padding: const EdgeInsets.all(2),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//           child: Container(
//             alignment: Alignment.bottomCenter,
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }
