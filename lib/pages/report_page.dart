import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';
import 'package:sigset_xtc/widgets/title_widget.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 13, 17),
      body: Column(
        children: [
          const HeaderWidget(),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const TitleWidget(
                text: "Genera tus reportes",
                fontSize: 24,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const TextWidget(
                      text:
                          "Ten un resumen de lo realizado a lo largo del tiempo")),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const ButtonReportWidget(
                  iconPath: "assets/nutrition_icon.png", name: "Alimentación"),
              const SizedBox(
                height: 30,
              ),
              const ButtonReportWidget(
                  iconPath: "assets/training_icon.png", name: "Entrenamiento"),
              const SizedBox(
                height: 30,
              ),
              const ButtonReportWidget(
                  iconPath: "assets/financial_icon.png", name: "Financiero"),
            ],
          )
        ],
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}

class ButtonReportWidget extends StatelessWidget {
  const ButtonReportWidget(
      {super.key, required this.iconPath, required this.name});

  final String iconPath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFB00020)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              iconPath,
              width: 30,
              height: 30,
            ),
            TextWidget(text: name),
          ],
        ),
      ),
    );
  }
}
