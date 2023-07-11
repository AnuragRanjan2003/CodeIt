import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final void Function() onPressed;
  final LinearGradient grad;
  final Widget child;
  final double rad;
  final double vPad;

  const GradientButton(
      {super.key,
      required this.onPressed,
      required this.grad,
      required this.child,
      this.rad = 20,
      this.vPad = 18});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.all(Radius.circular(rad)),
        onTap: () {
          onPressed();
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: grad,
              borderRadius: BorderRadius.all(Radius.circular(rad))),
          padding: EdgeInsets.symmetric(vertical: vPad),
          child: Center(
            child: child,
          ),
        ));
  }
}
