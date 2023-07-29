import 'package:codeit/controllers/thread_controller.dart';
import 'package:codeit/screens/threads/variants/landscape/threads_landscape.dart';
import 'package:codeit/screens/threads/variants/portrait/threads_portrait.dart';
import 'package:codeit/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ThreadsScreen extends StatelessWidget {
  const ThreadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ThreadController());
    return Responsive(
      portrait: (con) => ThreadsPortrait(cons: con),
      landscape: (con) => ThreadsLandscape(cons: con),
    );
  }
}
