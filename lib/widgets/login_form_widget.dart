import 'package:flutter/material.dart';
import 'package:sigset_xtc/pages/home_page.dart';
import 'package:sigset_xtc/widgets/button_app_widget.dart';
import 'package:sigset_xtc/widgets/form_input_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';
import 'package:page_transition/page_transition.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;

  void _validateForm() {
    setState(() {
      _isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Form(
        key: _formKey,
        onChanged: _validateForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "Email"),
                SizedBox(height: 8),
                FormInputWidget(
                  placeholderText: "example@example.com",
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "Contraseña"),
                SizedBox(height: 8),
                FormInputWidget(
                  placeholderText: "*******",
                  isPasswordInput: true,
                ),
              ],
            ),
            const SizedBox(height: 30),
            ButtonAppWidget(
              text: "Ingresar",
              onPressed: _isButtonEnabled
                  ? () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                            child: const HomePage(),
                            type: PageTransitionType.fade,
                          ));
                    }
                  : () {},
            ),
            TextButton(
              onPressed: () {
                print("Recuperar contraseña");
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: const Text(
                "¿Olvidaste tu Contraseña?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
