// ignore: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sfc_project/SFC_Project/Presentation/Screens/onBoarding_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const OnBoardingScreens())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          //alignment: Alignment.center,
          height: double.infinity,

          width: double.infinity,
          // child: Image.asset("assets/images/img.jpg"),
          child: Image.asset("assets/images/b0.png"),
        ),
      ),
    );
  }
}
