import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sigset_xtc/pages/payment_page.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/info_widget.dart';
import 'package:sigset_xtc/widgets/title_widget.dart';

class MembershipPage extends StatelessWidget {
  const MembershipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const TitleWidget(
              text: "Renueva tu membresía",
              fontSize: 18,
            ),
            const SizedBox(
              height: 30,
            ),
            const InfoWidget(
                icon: Icons.access_time,
                name: "Tiempo Restante",
                timeSpent: "2 días"),
            const SizedBox(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const TitleWidget(
              text: "Nuestros Planes",
              fontSize: 18,
            ),
            const SizedBox(
              height: 30,
            ),
            const MembershipCard(planName: "Mensual", price: "\$79.000"),
            const SizedBox(
              height: 20,
            ),
            const MembershipCard(planName: "Semestral", price: "\$220.000"),
            const SizedBox(
              height: 20,
            ),
            const MembershipCard(planName: "Anual", price: "\$500.000"),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}

class MembershipCard extends StatelessWidget {
  final String planName;
  final String price;

  const MembershipCard({
    super.key,
    required this.planName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Sección superior: Nombre del plan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Text(
                planName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              price,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        child: const PaymentPage(),
                        type: PageTransitionType.fade,
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .primaryContainer, // Color del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  "Adquirir",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
