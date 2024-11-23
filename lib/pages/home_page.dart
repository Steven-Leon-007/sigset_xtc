import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/main_button_icon_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';
import 'package:sigset_xtc/widgets/title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 13, 17),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      const TitleWidget(
                        text: "Bienvenid@, [User]",
                        fontSize: 18,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextWidget(text: "¿Que vamos a hacer hoy?"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      Column(
                        children: [
                          MainButtonIconWidget(
                            text: "Alimentación",
                            onPressed: () {},
                            bgColor: const Color.fromARGB(255, 217, 217, 217),
                            iconPath: "assets/nutrition_home_icon.png",
                            fgColor: Colors.black,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MainButtonIconWidget(
                            text: "Entrenamiento",
                            onPressed: () {},
                            bgColor: const Color.fromARGB(255, 217, 217, 217),
                            iconPath: "assets/training_home_icon.png",
                            fgColor: Colors.black,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MainButtonIconWidget(
                            text: "Tu Progreso",
                            onPressed: () {},
                            bgColor: const Color.fromARGB(255, 189, 130, 9),
                            iconPath: "assets/reports_home_icon.png",
                            fgColor: Colors.black,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
