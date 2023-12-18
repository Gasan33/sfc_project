import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sfc_project/Core/Utilities/my_colors.dart';
import 'package:sfc_project/SFC_Project/Presentation/Controllars/Menu.dart';
import 'package:sfc_project/SFC_Project/Presentation/Controllars/bottom_navigation.dart';

class Zoom extends StatefulWidget {
  const Zoom({Key? key}) : super(key: key);

  @override
  State<Zoom> createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
  Menuitem currentItem = Menuitems.home;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ZoomDrawer(
        mainScreenScale: 0.1,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
        style: DrawerStyle.defaultStyle,
        slideWidth: MediaQuery.of(context).size.width * 0.55,
        menuScreenTapClose: true,
        borderRadius: 24,
        androidCloseOnBackTap: true,
        angle: 0.0,
        showShadow: false,
        isRtl: false,
        menuScreenWidth: MediaQuery.of(context).size.width * 0.55,
        moveMenuScreen: false,
        // drawerShadowsBackgroundColor: appColor,
        menuBackgroundColor: MyColors.mySubColor,
        menuScreen: Builder(builder: (context) {
          return Menu(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(
                () {
                  currentItem = item;
                  ZoomDrawer.of(context)!.close();
                },
              );
            },
          );
        }),
        mainScreen: getScreen(),
      ),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case Menuitems.home:
        return const BottomNavigation();
      case Menuitems.points:
        return const BottomNavigation();
      case Menuitems.settings:
        return const BottomNavigation();
      case Menuitems.aboutUs:
        return const BottomNavigation();
      case Menuitems.cusServ:
        return const BottomNavigation();
      default:
        return const BottomNavigation();
    }
  }
}
