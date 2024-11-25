import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sigset_xtc/pages/home_page.dart';
import 'package:sigset_xtc/pages/nutrition_page.dart';
import 'package:sigset_xtc/pages/profile_page.dart';
import 'package:sigset_xtc/pages/report_page.dart';
import 'package:sigset_xtc/pages/training_page.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';

class FooterWidget extends StatelessWidget {
  FooterWidget({super.key});

  final footerItems = [
    {
      'name': 'Nutrition',
      'iconPath': 'assets/nutrition_icon.png',
      'redirect': "/nutrition"
    },
    {
      'name': 'Training',
      'iconPath': 'assets/training_icon.png',
      'redirect': "/training"
    },
    {'name': 'Home', 'iconPath': 'assets/home_icon.png', 'redirect': "/home"},
    {
      'name': 'Profile',
      'iconPath': 'assets/profile_icon.png',
      'redirect': "/profile"
    },
    {
      'name': 'Reports',
      'iconPath': 'assets/reports_icon.png',
      'redirect': "/reports"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 22, 22, 22),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: footerItems.map((item) {
            return GestureDetector(
              onTap: () {
                final currentRoute = ModalRoute.of(context)?.settings.name;

                if (currentRoute != item['redirect']) {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type:
                          PageTransitionType.fade,
                      child: _getScreenByRoute(item['redirect']!),
                      duration: const Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    item['iconPath']!,
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: 30,
                  ),
                  TextWidget(
                    text: item['name']!,
                    fontSize: 10,
                    fgColor: Colors.white,
                  )
                ],
              ),
            );
          }).toList(),
        ));
  }

  Widget _getScreenByRoute(String route) {
    switch (route) {
      case "/nutrition":
        return const NutritionPage();
      case "/training":
        return const TrainingPage();
      case "/home":
        return const HomePage();
      case "/profile":
        return const ProfilePage();
      case "/reports":
        return const ReportPage();
      default:
        return const HomePage(); // Página predeterminada
    }
  }
}
