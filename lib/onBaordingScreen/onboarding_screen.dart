import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/onBaordingScreen/onboarding_screen_events.dart';
import 'package:myapp/onBaordingScreen/onboarding_screen_state.dart';

import 'onboarding_screen_bloc.dart';


class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: BlocBuilder<OnboardingScreenBloc, OnboardingScreenStates>(
        builder: (context, state) {
          return SizedBox(
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned.fill(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<OnboardingScreenBloc>(context)
                          .add(OnboardingScreenEvents());
                    },
                    children: [
                      _page(
                        0,
                        context,
                        "next",
                        "Find your Dream\nDestination",
                        "Discovering dream destinations has never been easier thanks to internet. No matter where, the world is your oyster.",
                        "assets/images/onboardScreen/image1.png",
                      ),
                      _page(
                        1,
                        context,
                        "next",
                        "Book your\nPreferred Ticket",
                        "It's time to book your dream destination. Compare flight, hotel, and transportation prices to find the best deal.",
                        "assets/images/onboardScreen/image2.png",
                      ),
                      _page(
                        2,
                        context,
                        "Get started",
                        "Enjoy Your Self\nMagical Trip",
                        "Your magical trip is finally here! New foods and cultures await you, offering endless adventures and memories. Take it easy and enjoy.",
                        "assets/images/onboardScreen/image3.png",
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 370.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      color: Colors.grey,
                      size: const Size.square(8.0),
                      activeColor: const Color(0xFF0CB1F1),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: SizedBox(
            width: 345.w,
            height: 345.w,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
          flex: 1,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFE5E4E6),
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF83868E),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        GestureDetector(
          onTap: () {
            if (index < 2) {
              pageController.animateToPage(
                index + 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil("homePage", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 30.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFF7C50),
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1))
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: const Color(0xFFE5E4E6),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
