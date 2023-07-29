import 'package:codeit/components/textbox.dart';
import 'package:codeit/controllers/auth_controller.dart';
import 'package:codeit/controllers/thread_controller.dart';
import 'package:codeit/res/colors/colors.dart';
import 'package:codeit/res/icons/icons.dart';
import 'package:codeit/res/strings/compose_strings.dart';
import 'package:codeit/res/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../../models/thread.dart';

class ComposeThreadPortrait extends StatelessWidget {
  final BoxConstraints cons;

  const ComposeThreadPortrait({super.key, required this.cons});

  @override
  Widget build(BuildContext context) {
    final double ht = cons.maxHeight;
    final double wd = cons.maxWidth;
    var domain = ComposeStrings.items[0];
    final TextEditingController titleController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();
    final ThreadController threadController = Get.find();
    final AuthController auth = Get.find();
    threadController.domain.value = domain;

    return Scaffold(
      backgroundColor: ProjectColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: ht,
            width: wd,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Give a title",
                  style: ProjectTextStyles.body,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextBox(
                    label: "title",
                    controller: titleController,
                    onChange: (p0) {
                      threadController.postOk.value = verifyPost(
                          titleController.value.text,
                          bodyController.value.text);
                    },
                    color: ProjectColors.deepPurple),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Choose domain",
                  textAlign: TextAlign.left,
                  style: ProjectTextStyles.body,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: ProjectColors.border),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Obx(() => DropdownButton(
                      isExpanded: true,
                      iconEnabledColor: ProjectColors.plainTextColor,
                      underline: const SizedBox.shrink(),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      dropdownColor: ProjectColors.onBackgroundColor,
                      style: ProjectTextStyles.body,
                      value: threadController.domain.value,
                      items: ComposeStrings.items
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Row(
                                children: [
                                  FaIcon(
                                    ProjectIcons().getIcon(e),
                                    color: ProjectColors.plainTextColor,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    e,
                                    style: ProjectTextStyles.body,
                                  ),
                                ],
                              )))
                          .toList(),
                      onChanged: (String? i) {
                        domain = i ?? ComposeStrings.items[0];
                        threadController.domain.value = domain;
                        debugPrint(threadController.domain.value);
                      })),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Give a description",
                  style: ProjectTextStyles.body,
                ),
                const SizedBox(height: 5),
                TextBox(
                    label: "Description",
                    multiLine: true,
                    controller: bodyController,
                    onChange: (p0) {
                      threadController.postOk.value = verifyPost(
                          titleController.value.text,
                          bodyController.value.text);
                    },
                    color: ProjectColors.deepPurple),
                const SizedBox(
                  height: 40,
                ),
                Obx(() => MaterialButton(
                      onPressed: () {
                        if (threadController.postOk.isTrue &&
                            auth.user.value != null) {
                          final user = auth.user.value!;
                          final id = const Uuid().v4();
                          final thread = Thread(
                              titleController.value.text,
                              bodyController.value.text,
                              user.name,
                              user.uid,
                              id,
                              DateTime.now(),
                              threadController.domain.value);
                          titleController.clear();
                          bodyController.clear();
                          threadController.addThread(thread);
                        }
                      },
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      color: getColor(threadController.postOk.value),
                      child: const Text(
                        "Done",
                        style: ProjectTextStyles.onButton,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool verifyPost(String s1, String s2) => s1.isNotEmpty && s2.isNotEmpty;

  Color getColor(bool e) {
    if (e) {
      return ProjectColors.deepPurple;
    } else {
      return ProjectColors.disabledColor;
    }
  }
}
