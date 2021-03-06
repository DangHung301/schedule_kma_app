import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kma_app/View/Screen/LoginScreen/login_screen.dart';
import 'package:kma_app/View/Screen/LoginScreen/login_viewmodel.dart';
import 'package:kma_app/View/Screen/Tabar/main_tabbar_view.dart';
import 'package:kma_app/View/Screen/Tabar/tabbar_viewModel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() {
    var _duration = const Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  void navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    print(token);

    if (token == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen(LoginViewModel())),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MainTabbarView(viewModel: TabbarViewModel())),
              (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image(
        image: AssetImage('assets/image/logo_splash_screen.png'),
      )),
    );
  }
}
