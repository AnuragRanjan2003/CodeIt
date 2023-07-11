import 'package:codeit/components/gradient_button.dart';
import 'package:codeit/components/snackbar.dart';
import 'package:codeit/components/textbox.dart';
import 'package:codeit/controllers/auth_controller.dart';
import 'package:codeit/models/user.dart';
import 'package:codeit/res/strings/add-account_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../res/colors/colors.dart';
import '../../../../res/styles/text_styles.dart';

class AddAccountsPortrait extends StatelessWidget {
  final BoxConstraints cons;

  const AddAccountsPortrait({super.key, required this.cons});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final wd = cons.maxWidth;
    final ht = cons.maxHeight;
    final cfController = TextEditingController();
    final gitController = TextEditingController();
    return Scaffold(
      backgroundColor: ProjectColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: ht,
          width: cons.maxWidth,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AddAccountString.title,
                style: ProjectTextStyles.title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                AddAccountString.sub,
                style: ProjectTextStyles.body,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: ht * 0.55,
                width: wd,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AddAccountString.addCF,
                          style: ProjectTextStyles.body,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextBox(
                            label: 'codeforces handle',
                            controller: cfController,
                            color: ProjectColors.purple),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AddAccountString.addGit,
                          style: ProjectTextStyles.body,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextBox(
                            label: 'github handle',
                            controller: gitController,
                            color: ProjectColors.purple),
                      ],
                    ),
                    GradientButton(
                        grad: ProjectColors.gradient,
                        onPressed: () {
                          if (authController.user.value == null) {
                            Get.showSnackbar(AppSnackBar().defaultSnackBar(
                                'Failure', 'invalid Credentials', 'go back'));
                            return;
                          }
                          User newUser = User(
                              authController.user.value!.name,
                              authController.user.value!.email,
                              authController.user.value!.password,
                              cfController.value.text,
                              gitController.value.text,
                              '');
                          authController.signUpUser(newUser);
                        },
                        child: Obx(() {
                          if (authController.loading.isFalse) {
                            return const Text(
                              'create account',
                              style: ProjectTextStyles.onButton,
                            );
                          } else {
                            return const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.0,
                                ));
                          }
                        })),
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
