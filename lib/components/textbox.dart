import 'package:codeit/res/colors/colors.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Color color;
  final bool pass;

  const TextBox(
      {super.key,
      required this.label,
      required this.controller,
      required this.color,
      this.pass = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: pass,
      style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
      decoration: InputDecoration(
          hintText: 'Enter your $label',
          focusColor: color,
          hintStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(15)))),
    );
  }
}
