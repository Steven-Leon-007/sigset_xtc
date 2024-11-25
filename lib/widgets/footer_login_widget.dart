import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';

class FooterLoginWidget extends StatelessWidget {
  const FooterLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      alignment: Alignment.center,
      child: const TextWidget(
        text: "Diseñado y Construido por Xtreme Training Center",
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
