import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';

class FooterLoginWidget extends StatelessWidget {
  const FooterLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 19, 19, 19),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: const TextWidget(
        text: "Diseñado y Construido por Xtreme Training Center",
        fgColor: Colors.white,
        fontSize: 18,
      ),
    );
  }
}
