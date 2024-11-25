import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sigset_xtc/pages/generate_report_page.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';
import 'package:sigset_xtc/widgets/title_widget.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                iconPath: "assets/nutrition_icon.png",
                name: "Alimentación",
                routeParams: "Alimentación",
              ),
              const SizedBox(
                height: 30,
              ),
              const ButtonReportWidget(
                iconPath: "assets/training_icon.png",
                name: "Entrenamiento",
                routeParams: "Entrenamiento",
              ),
              const SizedBox(
                height: 30,
              ),
              const ButtonReportWidget(
                iconPath: "assets/financial_icon.png",
                name: "Historial de pagos",
                routeParams: "Historial de pagos",
              ),
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
      {super.key,
      required this.iconPath,
      required this.name,
      required this.routeParams});

  final String iconPath;
  final String name;
  final String routeParams;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: GenerateReportPage(reportType: routeParams),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              iconPath,
              width: 30,
              height: 30,
            ),
            TextWidget(text: name, fgColor: Colors.white,),
          ],
        ),
      ),
    );
  }
}
