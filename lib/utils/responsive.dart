import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget Function(BoxConstraints con) portrait;
  final Widget Function(BoxConstraints con) landscape;

  const Responsive(
      {super.key, required this.portrait, required this.landscape});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return landscape(constraints);
        } else {
          return portrait(constraints);
        }
      },
    );
  }
}
