import 'package:flutter/material.dart';
import 'package:sigset_xtc/pages/nutrition_page.dart';
import 'package:sigset_xtc/widgets/button_app_widget.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';
import 'package:sigset_xtc/widgets/title_widget.dart';

class GenerateReportPage extends StatefulWidget {
  final String reportType;

  const GenerateReportPage({super.key, required this.reportType});

  @override
  GenerateReportPageState createState() => GenerateReportPageState();
}

class GenerateReportPageState extends State<GenerateReportPage> {
  String _getReportImagePath(String reportType) {
    switch (reportType) {
      case "Alimentación":
        return 'assets/report_nutrition.png';
      case "Entrenamiento":
        return 'assets/report_training.png';
      case "Historial de pagos":
        return 'assets/report_financial.png';
      default:
        return 'assets/reports/default.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderWidget(),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TitleWidget(
                  text: "Reporte: ${widget.reportType}",
                  fontSize: 18,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const CustomTextField(
                            label: "Intervalo de fechas",
                            hintText: "DD/MM/YYYY - DD/MM/YYYY"),
                      ),
                      const SizedBox(height: 16),
                      if (widget.reportType == "Alimentación")
                        const CustomTextField(
                          label: "Filtrar por grupo de alimentos",
                          hintText: "Vegetales, Proteínas, Carbs.",
                        ),
                      if (widget.reportType == "Entrenamiento")
                        const CustomTextField(
                          label: "Filtrar por tipo de ejercicio",
                          hintText: "Fuerza, Cardio, Resistencia.",
                        ),
                      if (widget.reportType == "Historial de pagos")
                        const CustomTextField(
                          label: "Concepto de Pago (opcional)",
                          hintText: "TIpo de Membresía",
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ButtonAppWidget(
                    text: "Generar Reporte",
                    onPressed: () async {
                      // Muestra el SnackBar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          content: Text(
                            "Generando reporte de ${widget.reportType}",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                          ),
                          duration: const Duration(
                              seconds:
                                  2), // Mantiene el SnackBar visible por 2 segundos
                        ),
                      );

                      // Delay de 2 segundos
                      await Future.delayed(const Duration(seconds: 2));

                      // Muestra el pop-up con el reporte
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            contentPadding: const EdgeInsets.all(8),
                            content: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: SingleChildScrollView(
                                child: Image.asset(
                                  _getReportImagePath(widget.reportType),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: const TextWidget(text: "Imprimir PDF"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const TextWidget(text: "Cerrar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}
