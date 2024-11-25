import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/info_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';
import 'package:sigset_xtc/widgets/title_widget.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const TitleWidget(
                  text: "Tu plan de entrenamiento",
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: Theme.of(context).colorScheme.primary),
                      onPressed: () {},
                    ),
                    const TextWidget(text: "Semana 3 (28 oct - 03 nov)"),
                    IconButton(
                      icon: Icon(Icons.arrow_forward,
                          color: Theme.of(context).colorScheme.primary),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoWidget(
                        icon: Icons.access_time,
                        name: "Tiempo Total",
                        timeSpent: "2.5h"),
                    SizedBox(
                      width: 20,
                    ),
                    InfoWidget(
                        icon: Icons.developer_board_outlined,
                        name: "Sets Totales",
                        timeSpent: "23"),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TitleWidget(
                    text: "Entrenamientos de la semana",
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CardTrainingWidget(
                  title: 'Chest Day - I',
                  description:
                      'x4 Chest press (Barbell), x4 Incline chest press (Machine)...',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                CardTrainingWidget(
                  title: 'Leg Day  - I',
                  description:
                      'x4 Leg extension (Machine), x4 Hamstrings Curl (Machine)...',
                  onTap: () {},
                  bgColor: Theme.of(context).colorScheme.primaryContainer,
                ),
                const SizedBox(
                  height: 10,
                ),
                CardTrainingWidget(
                  title: 'Arms Day  - I',
                  description:
                      'x4 Preacher curl (Machine), x4 Triceps extension (Barbell)...',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                CardTrainingWidget(
                  title: 'Back Day  - I',
                  description:
                      'x4 Lat Pulldown (Cable), x4 Seated Cable Row (Machine)...',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}

class CardTrainingWidget extends StatelessWidget {
  const CardTrainingWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.onTap,
      this.bgColor});

  final String title;
  final String description;
  final VoidCallback onTap;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: bgColor ?? Theme.of(context).colorScheme.secondaryContainer,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.fitness_center,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary.withAlpha(200),
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
