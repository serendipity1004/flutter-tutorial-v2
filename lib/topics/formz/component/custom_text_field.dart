import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? errorText;
  final bool obscureText;

  CustomTextField({
    required this.label,
    required this.onChanged,
    this.hintText,
    this.errorText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          this.label,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.blue,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextField(
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            hintStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.grey[400],
            ),
            hintText: this.hintText,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            errorText: this.errorText,
          ),
        ),
      ],
    );
  }
}
