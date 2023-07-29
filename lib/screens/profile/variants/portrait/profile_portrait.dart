import 'package:codeit/components/gradient_button.dart';
import 'package:codeit/controllers/GitController.dart';
import 'package:codeit/controllers/auth_controller.dart';
import 'package:codeit/res/colors/colors.dart';
import 'package:codeit/res/img/project_images.dart';
import 'package:codeit/res/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ProfileScreenPortrait extends StatelessWidget {
  final BoxConstraints cons;

  const ProfileScreenPortrait({super.key, required this.cons});

  @override
  Widget build(BuildContext context) {
    final AuthController auth = Get.find();
    final git = Get.put(GitController());
    git.getGitUser("AnuragRanjan2003");
    final wd = cons.maxWidth;
    final ht = cons.maxHeight;
    return SizedBox(
      height: ht * 0.9,
      width: wd,
      child: SingleChildScrollView(
        child: Container(
          height: ht * 0.9,
          width: wd,
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          color: ProjectColors.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(()=>CircleAvatar(
                backgroundColor: ProjectColors.plainTextColor,
                radius: 55,
                foregroundImage:
                    NetworkImage(git.gitUser.value.avatarUrl.toString()),

              )),
              Obx(() => Text(
                    git.gitUser.value!.name.toString(),
                    style: ProjectTextStyles.normal,
                  )),
              SizedBox(
                height: ht * 0.04,
              ),
              OutlinedButton(
                  onPressed: () {
                    auth.logOut();
                  },
                  child: const Text(
                    'log out',
                    style: ProjectTextStyles.body,
                  )),
              SizedBox(
                height: ht * 0.05,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: ProjectImages.refs,
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        '20',
                        style: ProjectTextStyles.normal,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: ProjectImages.friends,
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        '10',
                        style: ProjectTextStyles.normal,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: ht * 0.05,
              ),
              Container(
                height: 65,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: const BoxDecoration(
                    color: ProjectColors.onBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        flex: 20,
                        child: MaterialButton(
                          onPressed: () {},
                          color: ProjectColors.backgroundColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'hello',
                              style: ProjectTextStyles.body,
                            ),
                          ),
                        )),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        flex: 20,
                        child: GradientButton(
                            onPressed: () {},
                            rad: 10,
                            vPad: 10,
                            grad: ProjectColors.gradient,
                            child: const Text(
                              'hello',
                              style: ProjectTextStyles.body,
                            )))
                  ],
                ),
              ),
              Expanded(
                  child: SimpleCircularProgressBar(
                valueNotifier: ValueNotifier(100),
                animationDuration: 3,
                mergeMode: true,
                onGetText: (p0) => Text(
                  p0.toInt().toString(),
                  style: ProjectTextStyles.normal,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
