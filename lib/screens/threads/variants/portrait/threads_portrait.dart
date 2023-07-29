import 'package:codeit/controllers/thread_controller.dart';
import 'package:codeit/res/colors/colors.dart';
import 'package:codeit/res/img/project_images.dart';
import 'package:codeit/res/styles/text_styles.dart';
import 'package:codeit/screens/threads/variants/portrait/thread_item.dart';
import 'package:codeit/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ThreadsPortrait extends StatelessWidget {
  final BoxConstraints cons;

  const ThreadsPortrait({super.key, required this.cons});

  @override
  Widget build(BuildContext context) {
    final double wd = cons.maxWidth;
    final double ht = cons.maxHeight;
    final ThreadController threadController = Get.find();
    return Scaffold(
      backgroundColor: ProjectColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.compose);
        },
        backgroundColor: ProjectColors.deepPurple,
        child: const FaIcon(
          FontAwesomeIcons.pencil,
          color: ProjectColors.plainTextColor,
          size: 20,
        ),
      ),
      body: Container(
        height: ht * 0.98,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SizedBox(
          height: ht * 0.9,
          child: Column(
            children: [
              SizedBox(
                height: ht * 0.085,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Expanded(
                        flex: 5,
                        child: TextField(
                          style: ProjectTextStyles.body,
                          decoration: InputDecoration(
                              hintText: "search",
                              hintStyle: ProjectTextStyles.hint,
                              filled: true,
                              fillColor: ProjectColors.onBackgroundColor,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ProjectColors.plainTextColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: () {},
                          color: ProjectColors.onBackgroundColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: const Image(image: ProjectImages.search),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Obx(()=>ListView.separated(
                itemBuilder: (context, index) {
                  final item = threadController.list[index];
                  return ThreadItem(thread: item, dateNow: DateTime.now());
                },
                itemCount: threadController.list.length, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
              )))
            ],
          ),
        ),
      ),
    );
  }
}
