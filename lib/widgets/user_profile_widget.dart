import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sigset_xtc/pages/membership_page.dart';
import 'package:sigset_xtc/widgets/button_app_widget.dart';
import 'package:sigset_xtc/widgets/form_input_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';
import 'package:sigset_xtc/widgets/title_widget.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Theme.of(context).colorScheme.secondaryContainer,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Información Personal',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                TextWidget(
                  text: 'Correo Electrónico: usuario@email.com',
                ),
                SizedBox(height: 8),
                TextWidget(
                  text: 'Teléfono: +57 3126056428',
                ),
                SizedBox(height: 8),
                TextWidget(
                  text: 'Fecha de Registro: 01/01/2024',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          color: Theme.of(context).colorScheme.secondaryContainer,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Progreso Reciente',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                TextWidget(
                  text: '• 5 sesiones completadas esta semana',
                ),
                SizedBox(height: 8),
                TextWidget(
                  text: '• Última actividad: Chest Day - I',
                ),
                SizedBox(height: 8),
                TextWidget(
                  text: '• Calorías quemadas: 450 kcal',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 91, 91, 91), width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const TitleWidget(
                text: "Registrar metas y objetivos",
                fontSize: 18,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: const FormInputWidget(
                    placeholderText: "Registrar una nueva meta personal"),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ButtonAppWidget(
                    text: "Agregar Meta",
                    onPressed: () {},
                  )),
              const SizedBox(height: 32),
            ],
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: ButtonAppWidget(
              text: "Renovar Membresía",
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                      child: const MembershipPage(),
                      type: PageTransitionType.fade,
                    ));
              },
              bgColor: const Color.fromARGB(255, 189, 130, 9),
            )),
        const SizedBox(height: 16),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: ButtonAppWidget(
              text: "Editar Perfil",
              onPressed: () {},
              bgColor: const Color.fromARGB(255, 124, 58, 8),
            )),
        const SizedBox(height: 32),
      ],
    );
  }
}
