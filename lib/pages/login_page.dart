import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/footer_login_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [
        HeaderWidget(isLoginPage: false,),
        FooterLoginWidget()
      ],),
    );
  }
}