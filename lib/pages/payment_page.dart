import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';
import 'package:sigset_xtc/widgets/title_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 13, 17),
      body: Column(children: [
        const HeaderWidget(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              const TitleWidget(
                text: "Elige cómo quieres pagar",
                fontSize: 18,
              ),
              const SizedBox(
                height: 20,
              ),
              const TextWidget(
                  text:
                      "Tu forma de pago está encriptada y puedes cambiarla cuando quieras."),
              const TitleWidget(
                text: "Transacciones seguras y confiables",
                fontSize: 14,
              ),
              const SizedBox(
                height: 30,
              ),
              PaymentMethods(onCreditCardTap: () {}, onPseTap: () {}),
            ],
          ),
        )
      ]),
      bottomNavigationBar: FooterWidget(),
    );
  }
}

class PaymentMethods extends StatelessWidget {
  final VoidCallback onCreditCardTap;
  final VoidCallback onPseTap;

  const PaymentMethods({
    super.key,
    required this.onCreditCardTap,
    required this.onPseTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PaymentCard(
          title: "Tarjeta de crédito o débito",
          logos: const [
            "assets/visa_logo.png",
            "assets/mastercard_logo.png",
            "assets/amex_logo.png",
            "assets/diners_logo.png",
          ],
          onTap: onCreditCardTap,
        ),
        const SizedBox(height: 16),
        PaymentCard(
          title: "PSE",
          logos: const ["assets/pse_logo.png"],
          onTap: onPseTap,
        ),
      ],
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String title;
  final List<String> logos;
  final VoidCallback onTap;

  const PaymentCard({
    super.key,
    required this.title,
    required this.logos,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: const Color.fromARGB(255, 34, 34, 34),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: logos
                        .map((logoPath) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.asset(
                                logoPath,
                                width: 32,
                                height: 32,
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
