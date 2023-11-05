import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static void filedFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // static flushBarErrorMessage(BuildContext context, String message) async {
  //   Flushbar flushBar = Flushbar(
  //     title: "Title",
  //     titleColor: Colors.white,
  //     message: message,
  //     messageColor: Colors.white,
  //     duration: const Duration(seconds: 6),
  //     flushbarPosition: FlushbarPosition.TOP,
  //     flushbarStyle: FlushbarStyle.FLOATING,
  //     reverseAnimationCurve: Curves.decelerate,
  //     forwardAnimationCurve: Curves.elasticInOut,
  //     backgroundColor: const Color(0xff376c93),
  //     boxShadows: const [
  //       BoxShadow(
  //         color: Colors.green,
  //         offset: Offset(0.0, 2.0),
  //         blurRadius: 3.0,
  //       ),
  //     ],
  //     isDismissible: false,
  //     icon: const Icon(
  //       Icons.report,
  //       color: Colors.white,
  //     ),
  //   )..show(context);
  // }

  static void flushBarErrorMessage(BuildContext context, String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      title: "Yey!",
      message: message,
      flushbarStyle: FlushbarStyle.GROUNDED,
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
