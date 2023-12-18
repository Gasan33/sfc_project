import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sfc_project/Core/Utilities/app_constance.dart';
import 'package:sfc_project/Core/Utilities/my_colors.dart';
import 'package:sfc_project/SFC_Project/Presentation/Screens/home_screen.dart';
import 'package:sfc_project/SFC_Project/Presentation/Screens/notificastion_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;
  final screenPages = [
    const HomeScreen(),
    const NotificationScreen(),
    const HomeScreen(),
  ];

  // final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(pageIndex == 0
              ? "assets/images/b1.png"
              : pageIndex == 1
                  ? "assets/images/b3.png"
                  : "assets/images/b1.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: MyColors.myTransparentColor,
        appBar: AppBar(
          toolbarHeight: 64,
          automaticallyImplyLeading: false,
          backgroundColor: MyColors.myTransparentColor,
          centerTitle: pageIndex == 0 ? false : true,
          title: Text(
            pageIndex == 0
                ? 'Usre Name'
                : pageIndex == 1
                    ? "Notifications"
                    : "My Services",
            style: const TextStyle(
              color: MyColors.myBaseColor,
              fontSize: AppConstance.titleSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () => ZoomDrawer.of(context)!.toggle(),
            iconSize: 56.0,
            //tooltip: 'search',
            color: MyColors.myBaseColor,
            // icon: const ImageIcon(
            //   AssetImage(
            //     "icons/menu.png",

            //   ),

            //   size: 56,
            // ),
            icon: Image.asset(
              "assets/icons/menu.png",
              //fit: BoxFit.contain,
              height: 56,
              width: 56,
            ),
            // icon: const Icon(
            //   Icons.menu_rounded,
            //   color: Colors.black,
            // ),
          ),
        ),
        body: screenPages[pageIndex],
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Container(
          color: MyColors.myTransparentColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                surfaceTintColor: MyColors.myTransparentColor,
                indicatorColor: MyColors.myTransparentColor,
                labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(
                      color: MyColors.myBaseColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              child: NavigationBar(
                backgroundColor: MyColors.myTransparentColor,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                height: 48,
                selectedIndex: pageIndex,
                onDestinationSelected: (index) {
                  setState(
                    () {
                      pageIndex = index;
                    },
                  );
                },
                destinations: [
                  NavigationDestination(
                      icon: Image.asset(
                        "assets/icons/home.png",
                        fit: BoxFit.cover,
                        color: MyColors.mySubColor,
                        height: 128,
                        width: 128,
                      ),
                      label: 'Home',
                      selectedIcon: Image.asset(
                        "assets/icons/home.png",
                        fit: BoxFit.cover,
                        height: 128,
                        width: 128,
                      )),
                  NavigationDestination(
                      icon: Image.asset(
                        "assets/icons/not_with.png",
                        color: MyColors.mySubColor,
                        fit: BoxFit.cover,
                        height: 128,
                        width: 128,
                      ),
                      label: 'Notifications',
                      selectedIcon: Image.asset(
                        "assets/icons/not_with.png",
                        fit: BoxFit.cover,
                        height: 128,
                        width: 128,
                      )),
                  NavigationDestination(
                    icon: Image.asset(
                      "assets/icons/services.png",
                      color: MyColors.mySubColor,
                      fit: BoxFit.cover,
                      height: 128,
                      width: 128,
                    ),
                    label: 'Services',
                    selectedIcon: Image.asset(
                      "assets/icons/services.png",
                      fit: BoxFit.cover,
                      height: 128,
                      width: 128,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
