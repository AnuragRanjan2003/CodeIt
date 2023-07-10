import 'package:codeit/screens/main/variants/landscape/main_screen_landscape.dart';
import 'package:codeit/screens/main/variants/portrait/main_screen_portrait.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      portrait: (cons) => MainScreenPortrait(cons: cons),
      landscape: (cons) => MainScreenLandscape(cons: cons),
    );
  }
}
