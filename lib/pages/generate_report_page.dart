import 'package:flutter/material.dart';
import 'package:sigset_xtc/pages/nutrition_page.dart';
import 'package:sigset_xtc/widgets/button_app_widget.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/title_widget.dart';

class GenerateReportPage extends StatefulWidget {
  final String reportType;

  const GenerateReportPage({super.key, required this.reportType});

  @override
  GenerateReportPageState createState() => GenerateReportPageState();
}

class GenerateReportPageState extends State<GenerateReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 17, 13, 17),
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
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Generando reporte de ${widget.reportType}"),
                          ),
                        );
                      }),
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
