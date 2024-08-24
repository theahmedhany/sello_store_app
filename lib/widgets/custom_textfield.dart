import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.hint,
      this.textType,
      this.onchange,
      this.obscureText = false})
      : super(key: key);

  String? hint;
  TextInputType? textType;
  bool? obscureText;
  Function(String)? onchange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xffA4C3B2),
      style: const TextStyle(
        color: Color(0xff6B9080),
        fontSize: 20,
      ),
      obscureText: obscureText!,
      onChanged: onchange,
      keyboardType: textType,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
        hintStyle: const TextStyle(color: Color(0xff6B9080), fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 3,
            color: Color(0xffA4C3B2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 3,
            color: Color(0xff6B9080),
          ),
        ),
      ),
    );
  }
}
