import 'package:codeit/res/colors/colors.dart';
import 'package:flutter/cupertino.dart';

class ProjectTextStyles {
  static const title = TextStyle(color: ProjectColors.plainTextColor , fontSize: 36 , fontWeight: FontWeight.w900);
  static const onButton = TextStyle(color: ProjectColors.plainTextColor , fontSize: 16 , fontWeight: FontWeight.w700);
  static const snackButton = TextStyle(color: ProjectColors.blue , fontSize: 14 , fontWeight: FontWeight.w700);
  static const body = TextStyle(color: ProjectColors.plainTextColor , fontSize: 16 , fontWeight: FontWeight.w500);
  static const normal = TextStyle(color: ProjectColors.plainTextColor , fontSize: 18 , fontWeight: FontWeight.w600);
  static const hint = TextStyle(color: ProjectColors.disabledColor , fontSize: 16 , fontWeight: FontWeight.w400);
  static const threadName = TextStyle(color: ProjectColors.disabledColor , fontSize: 14 , fontWeight: FontWeight.w400);
  static const smallText = TextStyle(color: ProjectColors.backgroundColor , fontSize: 12 , fontWeight: FontWeight.w400);
  static const smallTextWhite = TextStyle(color: ProjectColors.plainTextColor , fontSize: 12 , fontWeight: FontWeight.w400);
}