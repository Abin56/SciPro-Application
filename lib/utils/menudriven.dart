import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scipro/screens/live_courses.dart';
import 'package:scipro/screens/recorded_courses.dart';
import 'package:scipro/signin/student_faculty_login_screen.dart';

class NavDrawer extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(""),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {
            Navigator.push(
             context,
            MaterialPageRoute(builder: (context) => RecordedCourses()),
             ),
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () =>
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LiveCourses()),
              ),},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {
                signOut(context),
              }
          ),
        ],
      ),
    );
  }
  void signOut(context)async{
    try{
      await auth.signOut().then((value) =>
      {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => StudentFacultyLoginScreen()), (route) => false)
      });
    }catch(e){
      errorBox(context, e);
    }
  }
  void errorBox(context,e){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Error"),
            content: Text(e.toString()),
          );
        });
  }

}