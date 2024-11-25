import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/footer_login_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';
import 'package:sigset_xtc/widgets/login_form_widget.dart';
import 'package:sigset_xtc/widgets/text_widget.dart';
import 'package:sigset_xtc/widgets/title_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderWidget(
                isLoginPage: true,
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  TitleWidget(
                    text: "SIGSET-XTC",
                    fontSize: 28,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextWidget(
                    text:
                        "Tu plataforma ideal para controlar tu progreso y alcanzar tus metas",
                  ),
                ],
              ),
              LoginFormWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const FooterLoginWidget(),
    );
  }
}
