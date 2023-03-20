import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';

void showLoginBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(24),
        topLeft: Radius.circular(24),
      ),
    ),
    builder: (context) {
      return LoginView();
    },
  );
}
