import 'package:flutter/material.dart';

class FormInputWidget extends StatelessWidget {
  const FormInputWidget({super.key, required this.placeholderText, this.isPasswordInput = false});

  final String placeholderText;
  final bool isPasswordInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      obscureText: isPasswordInput,
      decoration: InputDecoration(
        hintText: placeholderText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 28, 28, 28),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
