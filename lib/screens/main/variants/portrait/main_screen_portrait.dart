import 'package:codeit/res/colors/colors.dart';
import 'package:codeit/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../controllers/auth_controller.dart';

class MainScreenPortrait extends StatelessWidget {
  final BoxConstraints cons;

  const MainScreenPortrait({super.key, required this.cons});

  @override
  Widget build(BuildContext context) {
    final wd = cons.maxWidth;
    final ht = cons.maxHeight;
    final AuthController authController = Get.find();
    final pageController = PageController(initialPage: 1);
    return Scaffold(
      backgroundColor: ProjectColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width: cons.maxWidth,
                height: ht * 0.9,
                child: PageView(
                  controller: pageController,
                  children: const [
                    ProfileScreen(),
                    ProfileScreen(),
                    ProfileScreen(),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 12,
                        dotColor: Colors.grey,
                        activeDotColor: ProjectColors.purple),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
