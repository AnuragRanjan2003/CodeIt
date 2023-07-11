import 'package:codeit/controllers/auth_controller.dart';
import 'package:codeit/screens/profile/variants/landscape/profile_landscape.dart';
import 'package:codeit/screens/profile/variants/portrait/profile_portrait.dart';
import 'package:codeit/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<AuthController>();
    return Responsive(
      portrait: (con) => ProfileScreenPortrait(cons: con),
      landscape: (con) => ProfileScreenLandscape(cons: con),
    );
  }
}
