import 'package:flutter/material.dart';
import 'package:sfc_project/Core/Utilities/my_colors.dart';
import 'package:sfc_project/SFC_Project/Presentation/Controllars/Zoom.dart';
import 'package:sfc_project/SFC_Project/Presentation/Screens/login_screen.dart';
import 'package:sfc_project/SFC_Project/Presentation/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Radley",

        bottomSheetTheme: const BottomSheetThemeData(
            shadowColor: MyColors.myTransparentColor,
            modalBarrierColor: MyColors.myTransparentColor,
            dragHandleColor: MyColors.myTransparentColor,
            surfaceTintColor: MyColors.myTransparentColor,
            modalBackgroundColor: MyColors.myTransparentColor,
            backgroundColor: MyColors.myTransparentColor),
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
