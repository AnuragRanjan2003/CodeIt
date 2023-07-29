import 'package:codeit/controllers/auth_controller.dart';
import 'package:codeit/screens/login/variants/landscape/login_land.dart';
import 'package:codeit/screens/login/variants/portrait/login_portrait.dart';
import 'package:codeit/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    debugPrint('login rebuilt');

    return Responsive(
        portrait: (cons) => LoginScreenPortrait(cons: cons),
        landscape: (cons) => LoginScreenLandscape(cons: cons));
  }
}
