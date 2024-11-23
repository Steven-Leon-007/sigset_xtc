import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';

class MainButtonIconWidget extends StatelessWidget {
  const MainButtonIconWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.bgColor,
      required this.iconPath,
      required this.fgColor});

  final String text;
  final VoidCallback onPressed;
  final Color bgColor;
  final String iconPath;
  final Color fgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor, // Color rojo del botón
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Bordes redondeados
            ),
          ),
          onPressed: onPressed,
          child: Row(
            children: [
              Image.asset(
                iconPath,
                height: MediaQuery.of(context).size.width * 0.1,
                width: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              TextWidget(
                text: text,
                fgColor: fgColor,
              ),
            ],
          )),
    );
  }
}
