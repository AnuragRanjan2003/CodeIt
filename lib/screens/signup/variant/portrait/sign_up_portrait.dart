import 'package:codeit/components/textbox.dart';
import 'package:codeit/controllers/auth_controller.dart';
import 'package:codeit/models/user.dart';
import 'package:codeit/res/strings/signup_string.dart';
import 'package:codeit/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../res/colors/colors.dart';
import '../../../../res/img/project_images.dart';
import '../../../../res/styles/text_styles.dart';

class SignUpPortrait extends StatelessWidget {
  final BoxConstraints cons;

  const SignUpPortrait({super.key, required this.cons});

  @override
  Widget build(BuildContext context) {
    final wd = cons.maxWidth;
    final ht = cons.maxHeight;
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final userController = TextEditingController();
    final AuthController authController = Get.find();
    return Scaffold(
      backgroundColor: ProjectColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: cons.maxWidth,
          child: Column(
            children: [
              Image(
                image: ProjectImages.blueWaveUp,
                width: wd,
                fit: BoxFit.fill,
                height: ht * 0.15,
              ),
              Container(
                height: ht * 0.65,
                width: wd,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      SignUpString.title,
                      style: ProjectTextStyles.title,
                      textAlign: TextAlign.center,
                    ),
                    TextBox(
                        label: 'Email',
                        controller: emailController,
                        color: ProjectColors.blue),
                    TextBox(
                        label: 'username',
                        controller: userController,
                        color: ProjectColors.blue),
                    TextBox(
                      label: 'password',
                      controller: passController,
                      color: ProjectColors.blue,
                      pass: true,
                    ),
                    MaterialButton(
                        onPressed: () {
                          authController.authError.value = checkValidity(
                              emailController.value.text,
                              passController.value.text,
                              userController.value.text);
                          if (authController.authError.value == null) {
                            authController.user.value = User(
                                userController.value.text,
                                emailController.value.text,
                                passController.value.text,
                                '',
                                '',
                                '');
                            Get.toNamed(Routes.addAccount);
                          }
                        },
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        color: ProjectColors.blue,
                        child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Next',
                              style: ProjectTextStyles.onButton,
                            ))),
                    MaterialButton(
                      onPressed: () {},
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: ProjectColors.blue, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Go Back',
                          style: ProjectTextStyles.onButton,
                        ),
                      ),
                    )
                  ].animate().slideX(),
                ),
              ),
              Image(
                image: ProjectImages.blueWave,
                width: wd,
                fit: BoxFit.fill,
                height: ht * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? checkValidity(String e, String p, String n) {
  if (e.trim().isBlank!) return 'email empty';
  if (p.trim().isBlank!) return 'email empty';
  if (n.trim().isBlank!) return 'email empty';
  return null;
}
