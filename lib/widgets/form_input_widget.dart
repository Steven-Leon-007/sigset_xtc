import 'package:flutter/material.dart';

class FormInputWidget extends StatelessWidget {
  const FormInputWidget(
      {super.key,
      required this.placeholderText,
      this.isPasswordInput = false,
      this.textEditingController});

  final String placeholderText;
  final bool isPasswordInput;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
      obscureText: isPasswordInput,
      decoration: InputDecoration(
        hintText: placeholderText,
        hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary.withAlpha(150)),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondaryContainer,
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
