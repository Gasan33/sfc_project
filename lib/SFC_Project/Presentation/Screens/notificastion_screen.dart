import 'package:flutter/material.dart';
import 'package:sfc_project/Core/Utilities/app_constance.dart';
import 'package:sfc_project/Core/Utilities/my_colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: MyColors.myTransparentColor,
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return buildNotification(
                  "assets/icons/man.png",
                  "Service Complete",
                  "we are glad to inform you that service has been successfully completed.",
                  true);
            case 1:
              return buildNotification(
                  "assets/icons/alrate.png",
                  "Service Issue",
                  "We are sorry to tell you that we are facing some problems and trying to solve it.",
                  false);
            case 2:
              return buildNotification(
                  "assets/icons/timer.png",
                  "Service pending",
                  "We want to discuss some details about service with you.",
                  false);
          }
          return null;
        },
      ),
    );
  }
}

Widget buildNotification(
    String iconUrl, String title, String detail, bool flag) {
  return Container(
    decoration: BoxDecoration(
      color: MyColors.myWhiteColor,
      borderRadius: BorderRadius.circular(16),
    ),
    margin: const EdgeInsets.all(8.0),
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            iconUrl,
            height: 64,
            width: 64,
            fit: flag ? null : BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
            flex: 16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: MyColors.myBaseColor,
                    fontSize: AppConstance.titleSize,
                  ),
                ),
                Text(
                  detail,
                  style: const TextStyle(
                    color: MyColors.myBaseColor,
                    fontSize: AppConstance.fontSize,
                  ),
                  maxLines: 2,
                ),
              ],
            ))
      ],
    ),
  );
}
