import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, this.onTap});

  final String text;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff6B9080),
          borderRadius: BorderRadius.circular(50),
        ),
        width: double.infinity,
        height: 65,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            fontSize: 25,
            color: Color(0xffF6FFF8),
          ),
        )),
      ),
    );
  }
}
