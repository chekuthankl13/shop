import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task/db/db.dart';
import 'package:task/models/auth/auth_model.dart';
import 'package:task/presentation/auth/login_screen.dart';
import 'package:task/presentation/profile/profile_screen.dart';
import 'package:task/utils/utils.dart';

class SPlashScreen extends StatefulWidget {
  const SPlashScreen({super.key});

  @override
  State<SPlashScreen> createState() => _SPlashScreenState();
}

class _SPlashScreenState extends State<SPlashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () async {
        bool isUser = await checkIuser();
        if (isUser) {
          navigatorKey.currentState!.pushReplacement(MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
        } else {
          var res = await getUser();

          AuthModel u = AuthModel(
              email: res['email'],
              gender: res['gender'],
              img: res['img'],
              userName: res['user'],
              id: res['id'],
              token: res['token']);

          navigatorKey.currentState!.pushReplacement(MaterialPageRoute(
            builder: (context) => ProfileScreen(credentials: u),
          ));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
