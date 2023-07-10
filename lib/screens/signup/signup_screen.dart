import 'package:codeit/screens/signup/variant/landscape/sign_up_landscape.dart';
import 'package:codeit/screens/signup/variant/portrait/sign_up_portrait.dart';
import 'package:codeit/utils/responsive.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        portrait: (cons) => SignUpPortrait(cons: cons),
        landscape: (cons) => SignUpLandscape(cons: cons));
  }
}
