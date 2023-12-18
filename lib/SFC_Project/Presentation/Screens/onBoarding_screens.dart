import 'package:flutter/material.dart';
import 'package:sfc_project/Core/Utilities/app_constance.dart';
import 'package:sfc_project/Core/Utilities/my_colors.dart';

import 'package:sfc_project/SFC_Project/Presentation/Screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget button(String txt) {
    return txt == 'SKIP'
        ? InkWell(
            onTap: () {
              controller.jumpToPage(2);
            },
            child: SizedBox(
              //color: Colors.black,
              width: MediaQuery.of(context).size.width / 3,
              child: Container(
                height: 48,
                width: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    //color: Colors.grey,
                    border:
                        Border.all(width: 0.5, color: MyColors.myBaseColor)),
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: Text(
                        txt,
                        style: const TextStyle(
                            color: MyColors.myBaseColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
          )
        : InkWell(
            onTap: () {
              controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            },
            child: SizedBox(
              //color: Colors.black,
              width: MediaQuery.of(context).size.width / 3,
              child: Container(
                height: 48,
                width: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: MyColors.myBaseColor,
                  //border: Border.all(width: 1, color: Colors.grey)
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                      child: Text(txt,
                          style: const TextStyle(
                              color: MyColors.myWhiteColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold))),
                ),
              ),
            ),
          );
  }

  Widget buildPage(
          {required Color color,
          required String urlImage,
          required String title,
          required String subTitle}) =>
      Container(
        color: color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                urlImage,
                fit: BoxFit.contain,
                height: 250.0,
                width: MediaQuery.of(context).size.width / 2,
                //width: double.minPositive,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: MyColors.myBaseColor,
                    fontSize: AppConstance.titleSize,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    subTitle,
                    style: const TextStyle(
                        color: MyColors.mySubColor,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        color: Colors.white,
        child: PageView(
          controller: controller,
          onPageChanged: (index) => {
            setState(
              () {
                isLastPage = index == 2;
              },
            )
          },
          children: [
            buildPage(
                color: Colors.white,
                urlImage: 'assets/lottie/L4.json',
                title: 'Welcome to SFC!',
                subTitle:
                    "Simplify your farming experience with SFC. We are here to make managing your farm easier and more efficient"),
            buildPage(
                color: Colors.white,
                urlImage: 'assets/lottie/L2.json',
                title: 'Choose Your Services',
                subTitle:
                    'Select the services you need assistance with. From irrigation to pest control, SFC has you covered.'),
            buildPage(
                color: Colors.white,
                urlImage: 'assets/lottie/L3.json',
                title: 'Your Farm, Your Dashboard',
                subTitle:
                    'Preview your personalized dashboard, where you can track farm activities, view analytics, and stay on top of upcoming tasks.'),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  top: 20, right: 20, left: 20, bottom: 40),
              child: TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: MyColors.myWhiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      backgroundColor: MyColors.myBaseColor,
                      minimumSize: const Size.fromHeight(56)),
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    "LET'S Started",
                    style: TextStyle(fontSize: AppConstance.subTitleSize),
                  )),
            )
          : Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  top: 20, right: 20, left: 20, bottom: 40),
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                          spacing: 16,
                          dotColor: MyColors.myGreyColor,
                          activeDotColor: MyColors.myBaseColor),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      button('SKIP'),
                      // TextButton(
                      //     onPressed: () => controller.jumpToPage(2),
                      //     child: const Text('SKIP')),
                      button('NEXT'),
                      // TextButton(
                      //     onPressed: () => controller.nextPage(
                      //         duration: const Duration(milliseconds: 500),
                      //         curve: Curves.easeInOut),
                      //     child: const Text('NEXT')),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
