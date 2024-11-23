import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';
import 'package:sigset_xtc/widgets/title_widget.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.title,
      required this.date,
      required this.description});

  final String title;
  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 91, 91, 91), width: 1),
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 30, 30, 30),
      ),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TitleWidget(
              text: title,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/user_icon.png",
                width: 40,
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleWidget(
                    text: date,
                    fontSize: 14,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextWidget(
                      text: description,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
