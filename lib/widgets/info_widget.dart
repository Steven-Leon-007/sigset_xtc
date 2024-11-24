import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {super.key,
      required this.icon,
      required this.name,
      required this.timeSpent});

  final IconData icon;
  final String timeSpent;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        border:
            Border.all(color: const Color.fromARGB(255, 91, 91, 91), width: 1),
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 30, 30, 30),
      ),
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {},
          ),
          TextWidget(
            text: timeSpent,
            fontSize: 18,
          ),
          TextWidget(text: name)
        ],
      ),
    );
  }
}
