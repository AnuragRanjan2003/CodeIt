import 'package:codeit/screens/addAccounts/variants/landscape/add_account_landscape.dart';
import 'package:codeit/screens/addAccounts/variants/portrait/add_account_portrait.dart';
import 'package:codeit/utils/responsive.dart';
import 'package:flutter/material.dart';

class AddAccountsScreen extends StatelessWidget {
  const AddAccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        portrait: (cons) => AddAccountsPortrait(cons: cons),
        landscape: (cons) => AddAccountsLandscape(cons: cons));
  }
}
