import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sigset_xtc/pages/create_post_page.dart';
import 'package:sigset_xtc/pages/nutrition_info_page.dart';
import 'package:sigset_xtc/pages/training_info_page.dart';
import 'package:sigset_xtc/pages/user_info_page.dart';
import 'package:sigset_xtc/services/preferences_service.dart';
import 'package:sigset_xtc/widgets/button_app_widget.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/user_profile_widget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userType = "Usuario";
  List<String> content = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    userVariations();
  }

  void userVariations() async {
    userType = await PreferencesService.getUserType();
    setState(() {
      switch (userType) {
        case "Usuario":
          content.add("Membresía Activa");
          break;
        case "Entrenador":
          content.add("Entrenador");
          break;
        case "Administrador":
          content.add("Administrador");
          break;
        default:
          break;
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(), // Indicador de carga
      );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Nombre del ${content[0]}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  content[0],
                  style: TextStyle(
                      fontSize: 16,
                      color:
                          Theme.of(context).colorScheme.primary.withAlpha(200),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 32),
            if (userType == "Usuario") UserProfileWidget(),
            if ((userType == "Administrador" || userType == "Entrenador") &&
                userType != "Usuario")
              Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: ButtonAppWidget(
                        text: "Consultar Usuario",
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                child: const UserInfoPage(),
                                type: PageTransitionType.fade,
                              ));
                        },
                        bgColor: Theme.of(context).colorScheme.primaryContainer,
                      )),
                  const SizedBox(height: 16),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: ButtonAppWidget(
                        text: "Consultar Plan de Alimentación",
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                child: const NutritionInfoPage(),
                                type: PageTransitionType.fade,
                              ));
                        },
                        bgColor: Theme.of(context).colorScheme.primaryContainer,
                      )),
                  const SizedBox(height: 16),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: ButtonAppWidget(
                        text: "Consultar Plan de Entrenamiento",
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                child: const TrainingInfoPage(),
                                type: PageTransitionType.fade,
                              ));
                        },
                        bgColor: Theme.of(context).colorScheme.primaryContainer,
                      )),
                  const SizedBox(height: 16),
                ],
              ),
            if (userType == "Administrador")
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ButtonAppWidget(
                    text: "Crear Publicación",
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            child: const CreatePostPage(),
                            type: PageTransitionType.fade,
                          ));
                    },
                    bgColor: const Color.fromARGB(255, 189, 130, 9),
                  )),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}
