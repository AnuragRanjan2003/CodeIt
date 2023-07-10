import 'package:codeit/components/textbox.dart';
import 'package:codeit/components/snackbar.dart';
import 'package:codeit/controllers/auth_controller.dart';
import 'package:codeit/models/user.dart';
import 'package:codeit/res/strings/add-account_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../res/colors/colors.dart';
import '../../../../res/img/project_images.dart';
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
          width: cons.maxWidth,
          child: Column(
            children: [
              Image(
                image: ProjectImages.blueWaveUp2,
                width: wd,
                fit: BoxFit.fill,
                height: ht * 0.20,
              ),
              Container(
                height: ht * 0.55,
                width: wd,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      AddAccountString.addCF,
                      style: ProjectTextStyles.body,
                    ),
                    TextBox(
                        label: 'codeforces',
                        controller: cfController,
                        color: ProjectColors.blue),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      AddAccountString.addGit,
                      style: ProjectTextStyles.body,
                    ),
                    TextBox(
                        label: 'github',
                        controller: gitController,
                        color: ProjectColors.blue),
                    const SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                        onPressed: () {
                          if(authController.user.value == null) {
                            Get.showSnackbar(AppSnackBar().defaultSnackBar('Failure', 'invalid Credentials','go back'));
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
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        color: ProjectColors.blue,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
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
                          }),
                        )),
                  ].animate().slideX(),
                ),
              ),
              Image(
                image: ProjectImages.blueWave2,
                width: wd,
                fit: BoxFit.fill,
                height: ht * 0.25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
