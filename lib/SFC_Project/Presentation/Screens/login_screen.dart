import 'package:flutter/material.dart';
import 'package:sfc_project/Core/Utilities/app_constance.dart';
import 'package:sfc_project/SFC_Project/Presentation/Controllars/Zoom.dart';

import '../../../Core/Utilities/my_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/b4.png"),
          fit: BoxFit.fill,
        ),
      ),
      padding: const EdgeInsets.all(40),
      child: Scaffold(
        backgroundColor: MyColors.myTransparentColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.5,
              ),
              buildusertextField(
                "Enter farm name",
                Icon(
                  Icons.person_2_rounded,
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              buildusertextField(
                "Enter farm ID",
                Icon(
                  Icons.password_rounded,
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              buildusertextField(
                "Enter Password",
                Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              SizedBox(
                // color: Colors.amber,
                height: 48,
                width: double.infinity,
                //margin: const EdgeInsets.all(16),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    //side: const BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: MyColors.myBaseColor,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Zoom(),
                      ),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: AppConstance.subTitleSize,
                      color: MyColors.myWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildusertextField(String hintText, Icon icon) {
  return Container(
    width: double.infinity,
    height: 48,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(
        width: 1,
        color: MyColors.myBaseColor,
      ),

      // boxShadow: [
      //   BoxShadow(
      //       offset: const Offset(3, 3),
      //       color: Colors.grey.shade300,
      //       blurRadius: 5),
      // ],
    ),
    child: TextField(
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade300),
        errorStyle: const TextStyle(color: Colors.red),
        border: InputBorder.none,
      ),
    ),
  );
}
