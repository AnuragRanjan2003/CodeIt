import 'package:codeit/components/gradient_button.dart';
import 'package:codeit/components/textbox.dart';
import 'package:codeit/controllers/auth_controller.dart';
import 'package:codeit/res/colors/colors.dart';
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
          height: ht,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                LoginStrings.title,
                style: ProjectTextStyles.title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              const Text(LoginStrings.sub, style: ProjectTextStyles.body,),
              const SizedBox(height: 20,),
              SizedBox(
                height: ht * 0.6,
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
                      const SizedBox(height: 8,),
                      TextBox(
                          label: 'Email',
                          controller: emailController,
                          color: ProjectColors.purple),

                    ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Text(
                        'password',
                        style: ProjectTextStyles.body,
                      ),
                      const SizedBox(height: 8,),
                      TextBox(
                        label: 'Password',
                        controller: passController,
                        color: ProjectColors.purple,
                        pass: true,
                      ),
                    ],),
                    GradientButton(
                        onPressed: () {
                          authController.loginUser(emailController.value.text,
                              passController.value.text);
                        },
                        grad: ProjectColors.gradient,
                        child: Obx(() {
                          if (authController.loading.isTrue) {
                            return const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            );
                          } else {
                            return const Text(
                              'Log in',
                              style: ProjectTextStyles.onButton,
                            );
                          }
                        })),
                    MaterialButton(
                      onPressed: () {
                        Get.toNamed(Routes.signup);
                      },
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: ProjectColors.purple, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
            ],
          ),
        ),
      ),
    );
  }
}
