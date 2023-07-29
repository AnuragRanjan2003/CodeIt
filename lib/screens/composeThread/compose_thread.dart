import 'package:codeit/screens/composeThread/variants/landscape/compose_thread_landscape.dart';
import 'package:codeit/screens/composeThread/variants/portrait/compose_thread_portrait.dart';
import 'package:codeit/utils/responsive.dart';
import 'package:flutter/material.dart';

class ComposeThreadScreen extends StatelessWidget {
  const ComposeThreadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      portrait: (con) => ComposeThreadPortrait(cons: con),
      landscape: (con) => ComposeThreadLandscape(cons: con),
    );
  }
}
