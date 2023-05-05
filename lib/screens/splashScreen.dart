import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:softtic_assessment/screens/homeScreen.dart';
import 'package:softtic_assessment/screens/loginScreen.dart';
import 'package:softtic_assessment/utils/AppImageUitls.dart';

import '../utils/app_common_util.dart';
import '../utils/shared_pref_utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  String isLoggedIn = "";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLogin();
    });
    super.initState();
  }

  void checkLogin() async {
    isLoggedIn = await SharedPrefUtil.getString("isLoggedIn");
    isLoggedIn == ""
        ? CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        Timer(
            const Duration(seconds: 4), //the wanted duration for the timer
                () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                )));
      }
    })
        : CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        Timer(
            const Duration(seconds: 4), //the wanted duration for the timer
                () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Lottie.asset(AppImageUtils.instance.splashAnim, repeat: true),
        ),
      ),
    );
  }
}
