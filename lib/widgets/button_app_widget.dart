import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';

class ButtonAppWidget extends StatelessWidget {
  const ButtonAppWidget(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Ocupa todo el ancho disponible
      height: 48, // Altura del botón
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB00020), // Color rojo del botón
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Bordes redondeados
            ),
          ),
          onPressed: onPressed,
          child: TextWidget(text: text)),
    );
  }
}
