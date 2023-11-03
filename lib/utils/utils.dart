import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static void filedFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      title: 'Hey Ninja',
      message:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: Duration(seconds: 3),
    ).show(context);
  }

  static void showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
