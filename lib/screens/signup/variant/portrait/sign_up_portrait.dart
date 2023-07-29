import 'package:codeit/components/gradient_button.dart';
import 'package:codeit/components/textbox.dart';
import 'package:codeit/controllers/auth_controller.dart';
import 'package:codeit/models/user.dart';
import 'package:codeit/res/strings/signup_string.dart';
import 'package:codeit/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../res/colors/colors.dart';
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
          height: ht,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                SignUpString.title,
                style: ProjectTextStyles.title,
              ),
              const Text(
                SignUpString.sub,
                style: ProjectTextStyles.body,
              ),
              SizedBox(
                height: ht * 0.7,
                width: wd,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: ProjectTextStyles.body,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextBox(
                            label: 'Email',
                            controller: emailController,
                            color: ProjectColors.purple),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'username',
                          style: ProjectTextStyles.body,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextBox(
                            label: 'username',
                            controller: userController,
                            color: ProjectColors.purple),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'password',
                          style: ProjectTextStyles.body,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextBox(
                          label: 'password',
                          controller: passController,
                          color: ProjectColors.purple,
                          pass: true,
                        ),
                      ],
                    ),
                    GradientButton(
                        grad: ProjectColors.gradient,
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
                        child: const Text(
                          'Next',
                          style: ProjectTextStyles.onButton,
                        )),
                    MaterialButton(
                      onPressed: () {},
                      shape: const RoundedRectangleBorder(
                          side:
                              BorderSide(color: ProjectColors.purple, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 17),
                        child: Text(
                          'Go Back',
                          style: ProjectTextStyles.onButton,
                        ),
                      ),
                    )
                  ].animate().slideX(),
                ),
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
