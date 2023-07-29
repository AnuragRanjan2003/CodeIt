import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectIcons {
  IconData getIcon(String s) {
    switch (s) {
      case "React":
        {
          return FontAwesomeIcons.react;
        }
      case "Angular":
        {
          return FontAwesomeIcons.angular;
        }
      case "Android Native":
        {
          return FontAwesomeIcons.android;
        }
      case "Flutter":
        {
          return FontAwesomeIcons.mobile;
        }
      case "JavaScript":
        {
          return FontAwesomeIcons.js;
        }
      case "Web":
        {
          return FontAwesomeIcons.html5;
        }

      default:
        {
          return FontAwesomeIcons.html5;
        }
    }
  }
}