import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/button_app_widget.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/form_input_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';

class TrainingInfoPage extends StatefulWidget {
  const TrainingInfoPage({super.key});

  @override
  State<TrainingInfoPage> createState() => TrainingInfoPageState();
}

class TrainingInfoPageState extends State<TrainingInfoPage> {
  final TextEditingController _searchController = TextEditingController();

  // Datos simulados
  final Map<String, String> _mockTrainingPlanData = {
    "Nombre": "Week 2-4",
    "Duración": "1.5 horas diarias",
    "Lunes": "Chest Day I - x4 Chest press (Barbell), x4 Incline chest press (Machine)...",
    "Martes": "Leg Day I - x4 Leg extension (Machine), x4 Hamstrings Curl (Machine)...",
    "Miércoles": "Descanso",
    "Jueves": "Arms Day I - x4 Preacher curl (Machine), x4 Triceps extension (Barbell)...",
    "Viernes": "Back Day I - x4 Lat Pulldown (Cable), x4 Seated Cable Row (Machine)...",
    "Sábado": "Chest Day II - x4 Chest press (Dumbell), x4 Dips (Weighted)...",
    "Domingo": "Descanso",
    "Estado": "Activo",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  FormInputWidget(
                    placeholderText:
                        "Buscar plan de entrenamiento por nombre...",
                    textEditingController: _searchController,
                    isPasswordInput: false,
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _mockTrainingPlanData.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Column(
                              children: [
                                TextWidget(
                                  text: "${entry.key}:",
                                  fgColor:
                                      Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 8),
                                TextWidget(
                                  text: entry.value,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      ButtonAppWidget(
                        text: "Agregar Plan de Entrenamiento",
                        bgColor: const Color.fromARGB(255, 189, 130, 9),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonAppWidget(
                        text: "Editar Plan de Entrenamiento",
                        bgColor: const Color.fromARGB(255, 189, 130, 9),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonAppWidget(
                        text: "Eliminar Plan de Entrenamiento",
                        onPressed: () {
                          // Acción para eliminar usuario
                          _showDeleteConfirmationDialog(context);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const TextWidget(text: "Confirmar Eliminación"),
          content: const TextWidget(
            text:
                "¿Estás seguro de que deseas eliminar este plan de entrenamiento? Esta acción no se puede deshacer.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo
              },
              child: const TextWidget(text: "Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                print(
                    "Plan de entrenamiento eliminado"); // Acción de eliminar plan
              },
              child: TextWidget(
                text: "Eliminar",
                fgColor: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        );
      },
    );
  }
}
