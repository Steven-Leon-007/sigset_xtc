import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/button_app_widget.dart';
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
          ),
          const SizedBox(
            height: 35,
          ),
          const TitleWidget(
            text: "Ingresar Comida",
            fontSize: 18,
          ),
          const SizedBox(
            height: 20,
          ),
          const NutritionForm(),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ButtonAppWidget(text: "Registrar", onPressed: () {})),
          const SizedBox(
            height: 30,
          ),
        ])
      ])),
      bottomNavigationBar: FooterWidget(),
    );
  }
}

class NutritionForm extends StatelessWidget {
  const NutritionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color.fromARGB(255, 98, 98, 98))),
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: "Nombre",
                  hintText: "Huevo, Carne, Verdura, etc",
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: CustomDropdownField(
                  label: "Grupo",
                  items: ["Vegetales", "Proteínas", "Frutas", "Carbohidratos"],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: "Porción",
                  hintText: "gramos, tazas, unidades",
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  label: "Valor nutricional",
                  hintText: "ej: 100g",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: const Color.fromARGB(255, 34, 34, 34),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDropdownField extends StatefulWidget {
  final String label;
  final List<String> items;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.items,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String selected = "Selecciona";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 34, 34, 34),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: const Color.fromARGB(255, 34, 34, 34),
              style: const TextStyle(color: Colors.white),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
              hint: Text(
                selected,
                style: const TextStyle(color: Colors.grey),
              ),
              items: widget.items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selected = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
