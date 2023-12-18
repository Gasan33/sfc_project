import 'package:flutter/material.dart';
import 'package:sfc_project/Core/Utilities/app_constance.dart';
import 'package:sfc_project/Core/Utilities/my_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myTransparentColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildSearchBar(),
              const SizedBox(
                height: 16,
              ),
              globalTitle("Services", 24),
              const SizedBox(
                height: 16,
              ),
              buildServicesWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildServicesWidget() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5 / 2.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: ((context, index) {
          switch (index) {
            case 0:
              return buildServiceView("CCTV", "assets/icons/cctv1.png");
            case 1:
              return buildServiceView(
                  "A/C Maintenance", "assets/icons/AC1.png");
            case 2:
              return buildServiceView(
                  "Agricultural expert", "assets/icons/17.png");
            case 3:
              return buildServiceView(
                  "Product Marketing", "assets/icons/shop1.png");
          }
          return null;
        }));
  }

  Widget buildServiceView(String title, String iconUrl) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.myBaseColor, width: 1),
        color: MyColors.myWhiteColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Scaffold(
        backgroundColor: MyColors.myWhiteColor,
        body: Center(
          child: Image.asset(
            iconUrl,
            fit: BoxFit.contain,
          ),
        ),
        bottomSheet: Container(
          color: MyColors.myWhiteColor,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: AppConstance.fontSize,
              color: MyColors.myBaseColor,
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildSearchBar() {
  return Container(
    width: double.infinity,
    height: 48,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      // boxShadow: [
      //   BoxShadow(
      //       offset: const Offset(3, 3),
      //       color: Colors.grey.shade300,
      //       blurRadius: 5),
      // ],
    ),
    child: TextField(
      decoration: textFormFieldDecoration(),
    ),
  );
}

InputDecoration textFormFieldDecoration() {
  return InputDecoration(
    suffixIcon: Image.asset(
      "assets/icons/filter.png",
      color: MyColors.myBaseColor,
      fit: BoxFit.cover,
      height: 48,
      width: 48,
    ),
    prefixIcon: const Icon(Icons.search),
    hintText: "Search",
    hintStyle: TextStyle(color: Colors.grey.shade300),
    errorStyle: const TextStyle(color: Colors.red),
    border: InputBorder.none,
  );
}

Widget globalTitle(String label, double height) {
  return Container(
    width: double.infinity,
    height: height,
    //color: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Radley'),
        ),
        InkWell(onTap: () {}, child: const Icon(Icons.more_horiz))
      ],
    ),
  );
}
