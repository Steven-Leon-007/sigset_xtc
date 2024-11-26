import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/button_app_widget.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/form_input_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';

class NutritionInfoPage extends StatefulWidget {
  const NutritionInfoPage({super.key});

  @override
  State<NutritionInfoPage> createState() => NutritionInfoPageState();
}

class NutritionInfoPageState extends State<NutritionInfoPage> {
  final TextEditingController _searchController = TextEditingController();

  // Datos simulados
  final Map<String, String> _mockMealPlanData = {
    "Nombre": "Proteico I",
    "Calorías Diarias": "2000 kcal",
    "Desayuno": "Avena con frutas",
    "Almuerzo": "Pollo con arroz y ensalada",
    "Cena": "Sopa de verduras",
    "Snacks": "Frutos secos, Yogurt",
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
                        "Buscar plan de alimentación por nombre...",
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
                        children: _mockMealPlanData.entries.map((entry) {
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
                        text: "Agregar Plan de Alimentación",
                        bgColor: const Color.fromARGB(255, 189, 130, 9),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonAppWidget(
                        text: "Editar Plan de Alimentación",
                        bgColor: const Color.fromARGB(255, 189, 130, 9),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonAppWidget(
                        text: "Eliminar Plan de Alimentación",
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
                "¿Estás seguro de que deseas eliminar este plan de alimentación? Esta acción no se puede deshacer.",
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
                    "Plan de alimentación eliminado"); // Acción de eliminar plan
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
