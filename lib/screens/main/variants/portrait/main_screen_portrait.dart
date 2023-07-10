import 'package:codeit/res/colors/colors.dart';
import 'package:codeit/res/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../controllers/auth_controller.dart';
import '../../../../res/img/project_images.dart';

class MainScreenPortrait extends StatelessWidget {
  final BoxConstraints cons;

  const MainScreenPortrait({super.key, required this.cons});

  @override
  Widget build(BuildContext context) {
    final wd = cons.maxWidth;
    final ht = cons.maxHeight;
    final AuthController authController = Get.find();
    return Scaffold(
      backgroundColor: ProjectColors.backgroundColor,
      bottomNavigationBar: Container(
        height: ht*0.10,
        margin: const EdgeInsets.only(bottom: 5,left: 8,right: 8),
        decoration: const BoxDecoration(color:Colors.black,borderRadius: BorderRadius.all( Radius.circular(20))),
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        child: GNav(
          tabs: const [
            GButton(
              icon: Icons.home,
              iconColor: Colors.white,
              text: 'home',
              textStyle: ProjectTextStyles.body,
            ),
            GButton(
              icon: Icons.settings,
              iconColor: Colors.white,
              text: 'settings',
              textStyle: ProjectTextStyles.body,
            ),
            GButton(
              icon: Icons.message_outlined,
              iconColor: Colors.white,
              text: 'messages',
              textStyle: ProjectTextStyles.body,
            ),
          ],
          gap: 8,
          padding: const EdgeInsets.all(12),
          tabBackgroundColor: Colors.grey.shade800,
          activeColor: Colors.white,
          backgroundColor: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: cons.maxWidth,
          child: Column(
            children: [
              Image(
                image: ProjectImages.orangeWaveUp,
                width: wd,
                fit: BoxFit.fill,
                height: ht * 0.15,
              ),
              Container(
                height: ht * 0.75,
                width: wd,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: PageView()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
