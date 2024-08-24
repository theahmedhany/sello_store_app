import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color(0xff6B9080),
      content: Text(
        message,
        style: const TextStyle(
          color: Color(0xffF6FFF8),
          fontSize: 17,
        ),
      ),
    ),
  );
}
