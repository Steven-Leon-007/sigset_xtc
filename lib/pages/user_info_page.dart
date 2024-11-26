import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/button_app_widget.dart';
import 'package:sigset_xtc/widgets/card_nutrition_widget.dart';
import 'package:sigset_xtc/widgets/card_training_widget.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/form_input_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => UserInfoPageState();
}

class UserInfoPageState extends State<UserInfoPage> {
  final TextEditingController _searchController = TextEditingController();

  // Datos simulados
  final Map<String, String> _mockUserData = {
    "Nombre": "Juan Pérez",
    "Correo": "juan.perez@example.com",
    "Tipo de Usuario": "Usuario",
    "Fecha de Registro": "01/01/2023",
    "Estado": "Activo",
  };

  final List<String> trainingPlans = [
    "Chest Day I - x4 Chest press (Barbell), x4 Incline chest press (Machine)...",
    "Leg Day I - x4 Leg extension (Machine), x4 Hamstrings Curl (Machine)...",
    "Descanso",
    "Arms Day I - x4 Preacher curl (Machine), x4 Triceps extension (Barbell)...",
    "Back Day I - x4 Lat Pulldown (Cable), x4 Seated Cable Row (Machine)...",
    "Chest Day II - x4 Chest press (Dumbell), x4 Dips (Weighted)...",
  ];

  final List<String> nutritionPlans = [
    "Día 1 - Desayuno: Avena con frutas; Almuerzo: Pollo con ensalada...",
    "Día 2 - Desayuno: Tortilla de claras; Almuerzo: Pescado con arroz...",
    "Día 3 - Desayuno: Yogur y granola; Almuerzo: Pechuga de pavo...",
    "Día 4 - Desayuno: Pan integral con aguacate; Almuerzo: Pasta integral...",
    "Día 5 - Desayuno: Batido de proteínas; Almuerzo: Ternera con verduras...",
  ];

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
                    placeholderText: "Buscar usuario por correo...",
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
                        children: _mockUserData.entries.map((entry) {
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
                  const TextWidget(text: "Acciones del Usuario"),
                  const SizedBox(height: 30),
                  ButtonAppWidget(
                    text: "Asignar Plan Alimentación",
                    bgColor: Theme.of(context).colorScheme.primaryContainer,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Planes de Alimentación"),
                            content: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: ListView.builder(
                                itemCount: nutritionPlans.length,
                                itemBuilder: (context, index) {
                                  return CardNutritionWidget(
                                    title: "Día ${index + 1}",
                                    description: nutritionPlans[index],
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer,
                                            content: Text(
                                              "Plan de Alimentación Asignado",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary, fontWeight: FontWeight.bold),
                                            )),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Cerrar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ButtonAppWidget(
                    text: "Asignar Plan Entrenamiento",
                    bgColor: Theme.of(context).colorScheme.primaryContainer,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Planes de Entrenamiento"),
                            content: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: ListView.builder(
                                itemCount: trainingPlans.length,
                                itemBuilder: (context, index) {
                                  return CardTrainingWidget(
                                    title: "Día ${index + 1}",
                                    description: trainingPlans[index],
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer,
                                            content: Text(
                                              "Plan de Entrenamiento Asignado",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary, fontWeight: FontWeight.bold),
                                            )),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Cerrar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  const TextWidget(text: "Otras Acciones"),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      ButtonAppWidget(
                        text: "Agregar Usuario",
                        bgColor: const Color.fromARGB(255, 189, 130, 9),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonAppWidget(
                        text: "Editar Usuario",
                        bgColor: const Color.fromARGB(255, 189, 130, 9),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonAppWidget(
                        text: "Eliminar Usuario",
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
                "¿Estás seguro de que deseas eliminar este usuario? Esta acción no se puede deshacer.",
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
                print("Usuario eliminado"); // Acción de eliminar usuario
              },
              child: TextWidget(
                text: "Eliminar",
                fgColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ],
        );
      },
    );
  }
}
