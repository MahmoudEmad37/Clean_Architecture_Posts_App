import 'package:flutter/material.dart';

class Constants {

  static void showSnackBar(
      {required BuildContext context,
      required String message,
      required Color backColor}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: backColor,
    ));
  }
}
