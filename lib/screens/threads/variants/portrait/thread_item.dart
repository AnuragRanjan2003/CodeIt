import 'package:codeit/models/thread.dart';
import 'package:codeit/res/colors/colors.dart';
import 'package:codeit/res/icons/icons.dart';
import 'package:codeit/res/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThreadItem extends StatelessWidget {
  final Thread thread;
  final DateTime dateNow;

  const ThreadItem({super.key, required this.thread, required this.dateNow});

  @override
  Widget build(BuildContext context) {
    final time = dateNow.difference(thread.date);
    String st = "today";
    if (time.inDays < 1) {
      st = "today";
    } else if (time.inDays < 7) {
      st = "${time.inDays} days";
    } else if (time.inDays < 30) {
      st = "this month";
    } else {
      st = "long ago";
    }
    return Container(
      decoration: const BoxDecoration(
          color: ProjectColors.threadColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            thread.title,
            style: ProjectTextStyles.normal,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "@${thread.username}",
            style: ProjectTextStyles.threadName,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: const BoxDecoration(
                    color: ProjectColors.plainTextColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.clock,
                      color: ProjectColors.backgroundColor,
                      size: 12,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      st,
                      style: ProjectTextStyles.smallText,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: ProjectColors.plainTextColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      ProjectIcons().getIcon(thread.domain),
                      size: 12,
                      color: ProjectColors.plainTextColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      thread.domain,
                      style: ProjectTextStyles.smallTextWhite,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            thread.discr,
            style: ProjectTextStyles.body,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  
}
