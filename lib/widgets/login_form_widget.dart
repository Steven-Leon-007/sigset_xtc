import 'package:flutter/material.dart';
import 'package:sigset_xtc/pages/home_page.dart';
import 'package:sigset_xtc/services/preferences_service.dart';
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
  final TextEditingController _emailController = TextEditingController();
  bool _isButtonEnabled = false;
  String _selectedUserType = "Usuario";

  void _validateForm() {
    setState(() {
      _isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  Future<void> _saveUserInfo(String userType) async {
    PreferencesService.saveUserType(userType);
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(text: "Email"),
                const SizedBox(height: 8),
                FormInputWidget(
                  placeholderText: "example@example.com",
                  textEditingController: _emailController,
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
            // RadioButtons para seleccionar tipo de usuario
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(text: "Tipo de Usuario"),
                Column(
                  children: [
                    RadioListTile<String>(
                      title: Text("Usuario",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
                      value: "Usuario",
                      groupValue: _selectedUserType,
                      onChanged: (value) {
                        setState(() {
                          _selectedUserType = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: Text("Entrenador",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
                      value: "Entrenador",
                      groupValue: _selectedUserType,
                      onChanged: (value) {
                        setState(() {
                          _selectedUserType = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: Text("Administrador",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
                      value: "Administrador",
                      groupValue: _selectedUserType,
                      onChanged: (value) {
                        setState(() {
                          _selectedUserType = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            ButtonAppWidget(
              text: "Ingresar",
              onPressed: _isButtonEnabled
                  ? () async {
                      await _saveUserInfo(_selectedUserType);
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
                final email = _emailController.text.trim();
                if (email.isEmpty) {
                  // Si el correo está vacío, mostramos un mensaje de error
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Error",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer),
                        ),
                        content: Text(
                          "Por favor, ingresa un correo para recuperar tu contraseña.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Cerrar el diálogo
                            },
                            child: TextWidget(
                              text: "OK",
                              fgColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Si el correo está ingresado, mostramos un mensaje de éxito
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        title: const TextWidget(text: "Recuperar Contraseña"),
                        content: TextWidget(
                            text:
                                "Se ha enviado un correo de recuperación a: $email"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: TextWidget(
                              text: "OK",
                              fgColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Text(
                "¿Olvidaste tu Contraseña?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.primary,
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
