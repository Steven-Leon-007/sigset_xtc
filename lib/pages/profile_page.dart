import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sigset_xtc/pages/membership_page.dart';
import 'package:sigset_xtc/widgets/button_app_widget.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 13, 17), // Fondo oscuro
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromARGB(255, 34, 34, 34),
                  child: Icon(
                    Icons.person, // Ícono de perfil predeterminado
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Nombre del Usuario', // Nombre dinámico
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Membresía Activa', // Estado de membresía
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 209, 209, 209),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Card(
              color: const Color.fromARGB(255, 34, 34, 34),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información Personal',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
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
              color: const Color.fromARGB(255, 34, 34, 34),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Progreso Reciente',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
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
            const SizedBox(height: 16),
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
                )),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}
