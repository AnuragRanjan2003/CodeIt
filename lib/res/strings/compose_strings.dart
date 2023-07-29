import 'package:flutter/material.dart';

class ComposeStrings {
  static const items = [
    _item1,
    _item2,
    _item3,
    _item4,
  ];

  final dropdownItems = [const DropdownMenuItem(value: _item1,child: Text(_item1),)];

  static const _item1 = "Android Native";
  static const _item2 = "React";
  static const _item3 = "Flutter";
  static const _item4 = "Angular";
}