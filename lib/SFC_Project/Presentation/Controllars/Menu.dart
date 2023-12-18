import 'package:flutter/material.dart';
import 'package:sfc_project/Core/Utilities/app_constance.dart';
import 'package:sfc_project/Core/Utilities/my_colors.dart';
import 'package:sfc_project/SFC_Project/Presentation/Screens/login_screen.dart';

class Menu extends StatelessWidget {
  final Menuitem currentItem;
  final ValueChanged<Menuitem> onSelectedItem;
  const Menu(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/b2.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: MyColors.myTransparentColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),

              Container(
                alignment: Alignment.center,
                child: const Text(
                  'user name',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: MyColors.mybackGroundColor,
                    fontSize: 24.0,
                    fontFamily: "Radley",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ...Menuitems.all.map(buildMenuItem).toList(),
              const Spacer(
                flex: 2,
              ),

              // Expanded(
              //   child: Align(
              //     alignment: FractionalOffset.bottomCenter,
              //     child: Container(
              //         //margin: EdgeInsets.only(bottom: 10.0),
              //         alignment: Alignment.center,
              //         child: Row(
              //           children: [
              //             Column(
              //               children: [
              //                 Container(
              //                   alignment: Alignment.center,
              //                   child: ElevatedButton(
              //                     onPressed: () => {
              //                       // _onlogoutSubmit(),
              //                       // Navigator.of(context).pushNamed('/Login')
              //                     },
              //                     style: ButtonStyle(
              //                       foregroundColor:
              //                           MaterialStateProperty.all(Colors.white),
              //                       backgroundColor: MaterialStateProperty.all(
              //                           Colors.transparent),
              //                       shape: MaterialStateProperty.all<
              //                               RoundedRectangleBorder>(
              //                           RoundedRectangleBorder(
              //                               borderRadius:
              //                                   BorderRadius.circular(25.0),
              //                               side: const BorderSide(
              //                                   color: Colors.black, width: 3))),
              //                     ),
              //                     child: Container(
              //                       width: MediaQuery.of(context).size.width / 3,
              //                       height: 50.0,
              //                       alignment: Alignment.center,
              //                       child: const Text(
              //                         'logout',
              //                         textAlign: TextAlign.right,
              //                         style: TextStyle(
              //                             fontSize: 15.0, color: Colors.white),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 // Container(
              //                 //   alignment: Alignment.bottomCenter,
              //                 //   child: Image.asset(
              //                 //     "assets/images/Bus_1.png",
              //                 //     height: 30.0,
              //                 //     width: 30.0,
              //                 //     fit: BoxFit.cover,
              //                 //   ),
              //                 // ),
              //                 // const Text(
              //                 //   'v 1.0',
              //                 //   textAlign: TextAlign.center,
              //                 // ),
              //               ],
              //             ),
              //           ],
              //         )),
              //   ),
              // ),
            ],
          ),
        ),
        bottomSheet: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            color: MyColors.myTransparentColor,
            alignment: Alignment.topCenter,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Logout",
                    style: TextStyle(
                      color: MyColors.mybackGroundColor,
                      fontSize: AppConstance.titleSize,
                      fontFamily: "Radley",
                    ),
                  ),
                  // const SizedBox(
                  //   width: 8.0,
                  // ),
                  Image.asset(
                    "assets/icons/logout.png",
                    fit: BoxFit.cover,
                    color: MyColors.mybackGroundColor,
                    height: 96,
                    width: 96,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(Menuitem item) => ListTileTheme(
        selectedColor: MyColors.myBaseColor,
        child: ListTile(
          selectedTileColor: MyColors.mybackGroundColor,
          selected: currentItem == item,

          //minLeadingWidth: 20.0,
          // leading: Text(item.title),
          // title: Icon(item.icon),
          onTap: () => onSelectedItem(item),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: item.icon,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Flexible(
                flex: 17,
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: currentItem == item
                        ? MyColors.myBaseColor
                        : MyColors.mybackGroundColor,
                    fontSize: AppConstance.subTitleSize,
                    fontFamily: "Radley",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class Menuitems {
  static const home = Menuitem(
    icon: Image(
      image: AssetImage("assets/icons/14.png"),
      fit: BoxFit.cover,
      //height: 128,
      //width: 128,
      color: MyColors.myBaseColor,
    ),
    title: 'Home',
  );
  static const points = Menuitem(
    icon: Image(
      image: AssetImage("assets/icons/points1.png"),
      //fit: BoxFit.cover,
      //height: 56,
      width: 56,
      color: MyColors.myBaseColor,
    ),
    title: 'Pionts',
  );
  static const settings = Menuitem(
    icon: Image(
      image: AssetImage("assets/icons/settings1.png"),
      //height: 10,
      width: 56,
      color: MyColors.myBaseColor,
    ),
    title: 'Settings',
  );
  static const aboutUs = Menuitem(
    icon: Image(
      image: AssetImage("assets/icons/info1.png"),
      //height: 10,
      width: 56,
      color: MyColors.myBaseColor,
    ),
    title: 'About us',
  );
  static const cusServ = Menuitem(
    icon: Image(
      image: AssetImage("assets/icons/feedback1.png"),
      //height: 10,
      width: 56,
      color: MyColors.myBaseColor,
    ),
    title: 'Customer services',
  );
  // static const Logout = Menuitem(
  //   icon: Icons.logout,
  //   title: 'تسجيل الخروج',
  // );

  static const all = <Menuitem>[
    home,
    points,
    settings,
    aboutUs,
    cusServ,
    // Logout,
  ];
}

class Menuitem {
  final String title;
  final Widget icon;

  const Menuitem({required this.title, required this.icon});
}
