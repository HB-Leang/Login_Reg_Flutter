import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText({
    super.key,
    this.prefixIcon,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
  });
  var controller = TextEditingController();
  bool? obscureText = true;
  String? prefixIcon;
  String hintText;
  IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText!,
        decoration: InputDecoration(
          prefixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Image.asset(
              prefixIcon!,
              width: 30,
              height: 30,
            ),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
