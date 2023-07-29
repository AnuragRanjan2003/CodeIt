import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Color color;
  final bool pass;
  final bool multiLine;
  final void Function(String)? onChange;

  const TextBox(
      {super.key,
      required this.label,
      required this.controller,
      required this.color,
      this.pass = false,
      this.multiLine = false,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    TextInputType type = TextInputType.text;
    int lines = 1;
    if (multiLine) {
      type = TextInputType.multiline;
      lines = 5;
    }
    return TextField(
      controller: controller,
      obscureText: pass,
      keyboardType: type,
      maxLines: lines,
      onChanged: (value) {
        if(onChange==null) {
          return;
        } else {
          onChange!(value);
        }
      },
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: 'Enter your $label',
        focusColor: color,
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
