import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/models/bottom_icon_model.dart';
import 'package:food_app/utils/colors.dart';

import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final List selectedPage = const [
    HomePage(),
    Center(child: Text("Message Page")),
    Center(child: Text("Explore ")),
    Center(child: Text("Profile ")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgColor,
      bottomNavigationBar: Container(
        height: 65.h,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(
              bottomIcons.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Column(
                    children: [
                      Icon(
                        currentIndex == index
                            ? bottomIcons[index].selected
                            : bottomIcons[index].unselected,
                        color: kblack,
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        decoration: BoxDecoration(
                          color: kblack,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: currentIndex == index ? 16.w : 0,
                        height: currentIndex == index ? 2.h : 0,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: selectedPage[currentIndex],
    );
  }
}
