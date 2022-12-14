import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro/bloc/auth_cubit.dart';
import 'package:scipro/model_classes/v_model.dart';
import 'package:scipro/screens/home_screen.dart';
import 'package:scipro/signin/g_signin.dart';
import 'package:scipro/signin/student_faclty_profilecreation.dart';
import 'package:scipro/signin/student_faculty_login_screen.dart';
import 'package:scipro/splash_screen/on_boarding.dart';
import 'package:scipro/splash_screen/splash_screen.dart';
import 'package:scipro/student_screens/Student_waiting_room.dart';
import 'package:scipro/video_player/video_screen.dart';
import 'package:scipro/video_player/videoplayer_firebase.dart';
import 'bloc/auth_state.dart';
import 'methods/auth_methods.dart';

bool? seenonboard;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(384.0, 805.3333333333334),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: GetMaterialApp(
            title: "Pixcles",
            home: BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (oldstate, newstate) {
                return oldstate is AuthInitialState;
              },
              builder: (context, state) {
                if (state is AuthLoggedInState) {
                  return Splashscreen();
                } else if (state is AuthLoggedOutState) {
                  return Gsignin();
                } else {
                  return Onboardingpage();
                }
              },
            ),
            debugShowCheckedModeBanner: false,
          ),
        );
        ;
      },
    );
  }
}
// GetMaterialApp(
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//           ),
//           debugShowCheckedModeBanner: false,
//           // home: StudentandFacultyCreationPage(),
//           home: StreamBuilder(
//             stream: AuthMethods().authChanges,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 double width = MediaQuery.of(context).size.width;
//                 double height = MediaQuery.of(context).size.height;
//                 log('Width${width.toString()}');
//                 log('Height${height.toString()}');
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (snapshot.hasData) {
//                 return  StudentandFacultyLoginScreen();
//               }
//               return const Gsignin();
//             },
//           ),
//         )