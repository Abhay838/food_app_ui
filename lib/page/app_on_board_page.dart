import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/models/on_board_model.dart';
import 'package:food_app/page/home_page.dart';
import 'package:food_app/page/main_page.dart';
import 'package:food_app/utils/colors.dart';

class AppOnBoardPage extends StatefulWidget {
  const AppOnBoardPage({super.key});

  @override
  State<AppOnBoardPage> createState() => _AppOnBoardPageState();
}

class _AppOnBoardPageState extends State<AppOnBoardPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: onboards.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned(
                      left: 0,
                      top: -70.h,
                      right: 0,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 500),
                        child: Image.asset(
                          onboards[index].image,
                          height: 500.h,
                          width: 500.w,
                          fit: BoxFit.contain,
                        ),
                      )),
                  Positioned(
                      top: 350.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.h),
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 500),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                onboards[index].text1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                onboards[index].text2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              );
            },
          ),
          Positioned(
              bottom: 140.h,
              left: 25.w,
              child: FadeInUp(
                delay: const Duration(milliseconds: 500),
                child: Row(
                  children: [
                    ...List.generate(
                      onboards.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: 5.h,
                        width: 45.w,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
              bottom: 20.h,
              child: FadeInUp(
                delay: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 70.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
                            ));
                      },
                      color: korange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.h),
                      ),
                      minWidth: 320.w,
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
