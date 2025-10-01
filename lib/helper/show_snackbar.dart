import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String showMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(showMessage),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.blue,
    ),
  );
}
