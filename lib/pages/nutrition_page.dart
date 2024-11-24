import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';
import 'package:sigset_xtc/widgets/title_widget.dart';

class NutritionPage extends StatelessWidget {
  const NutritionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 13, 17),
      body: SingleChildScrollView(
          child: Column(children: [
        const HeaderWidget(),
        Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const TitleWidget(
            text: "Tu plan de alimentación",
            fontSize: 18,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {},
              ),
              const TextWidget(text: "Semana 3 (28 oct - 03 nov)"),
              IconButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const TitleWidget(
            text: "Objetivos",
            fontSize: 18,
          ),
          const SizedBox(
            height: 25,
          ),
          Image.asset(
            "assets/graphs_icons.png",
            width: MediaQuery.of(context).size.width * 0.7,
          )
        ])
      ])),
      bottomNavigationBar: FooterWidget(),
    );
  }
}
