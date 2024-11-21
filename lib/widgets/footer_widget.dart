import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  FooterWidget({super.key});

  final footerItems = [
    {'name': 'Nutrition', 'iconPath': 'assets/nutrition_icon.png'},
    {'name': 'Training', 'iconPath': 'assets/training_icon.png'},
    {'name': 'Home', 'iconPath': 'assets/home_icon.png'},
    {'name': 'Profile', 'iconPath': 'assets/profile_icon.png'},
    {'name': 'Reports', 'iconPath': 'assets/reports_icon.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 19, 19, 19),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: footerItems.map((item) {
            return IconButton(
              icon: Image.asset(item['iconPath']!),
              iconSize: 30,
              tooltip: item['name'],
              onPressed: () {
                print('${item['name']} button pressed');
              },
            );
          }).toList(),
        ));
  }
}
