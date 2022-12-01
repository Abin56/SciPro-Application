import 'package:flutter/material.dart';

import '../methods/auth_methods.dart';
import '../widgets/custom_button.dart';


class Gsignin extends StatefulWidget {
  const Gsignin({Key? key}) : super(key: key);

  @override
  State<Gsignin> createState() => _GsigninState();
}

class _GsigninState extends State<Gsignin> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to SciPro',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/SCIPRO.png'),
          ),
          CustomButton(
            text: 'Google Sign In',
            onPressed: () async {
              bool res = await _authMethods.signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context, '/login');
              }
            },
          ),
        ],
      ),
    );
  }
}
