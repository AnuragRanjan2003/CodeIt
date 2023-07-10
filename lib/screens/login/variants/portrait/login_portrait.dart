import 'package:codeit/components/textbox.dart';
import 'package:codeit/controllers/auth_controller.dart';
import 'package:codeit/res/colors/colors.dart';
import 'package:codeit/res/dims/anim.dart';
import 'package:codeit/res/img/project_images.dart';
import 'package:codeit/res/strings/login_strings.dart';
import 'package:codeit/res/styles/text_styles.dart';
import 'package:codeit/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class LoginScreenPortrait extends StatelessWidget {
  final BoxConstraints cons;

  const LoginScreenPortrait({super.key, required this.cons});

  @override
  Widget build(BuildContext context) {
    final wd = cons.maxWidth;
    final ht = cons.maxHeight;
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final AuthController authController = Get.find();

    return Scaffold(
      backgroundColor: ProjectColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: cons.maxWidth,
          child: Column(
            children: [
              Image(
                image: ProjectImages.pinkWaveUp,
                width: wd,
                fit: BoxFit.fill,
                height: ht * 0.2,
              ),
              Container(
                height: ht * 0.5,
                width: wd,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      LoginStrings.title,
                      style: ProjectTextStyles.title,
                      textAlign: TextAlign.center,
                    ),
                    TextBox(
                        label: 'Email',
                        controller: emailController,
                        color: ProjectColors.pink),
                    TextBox(
                      label: 'Password',
                      controller: passController,
                      color: ProjectColors.pink,
                      pass: true,
                    ),
                    MaterialButton(
                        onPressed: () {
                          authController.loginUser(emailController.value.text,
                              passController.value.text);
                        },
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        color: ProjectColors.pink,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Obx(() {
                            if (authController.loading.isTrue) {
                              return const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white, strokeWidth: 2,),);

                            }else {
                              return const Text(
                              'Login',
                              style: ProjectTextStyles.onButton,
                            );
                            }
                          }),
                        )),
                    MaterialButton(
                      onPressed: () {
                        Get.toNamed(Routes.signup);
                      },
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: ProjectColors.pink, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Sign Up',
                          style: ProjectTextStyles.onButton,
                        ),
                      ),
                    )
                  ].animate().slideX(),
                ),
              ),
              Image(
                image: ProjectImages.pinkWave,
                width: wd,
                fit: BoxFit.fill,
                height: ht * 0.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
