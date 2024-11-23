import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:sigset_xtc/pages/home_page.dart';
import 'package:sigset_xtc/pages/login_page.dart';
import 'package:sigset_xtc/pages/membership_page.dart';
import 'package:sigset_xtc/pages/nutrition_page.dart';
import 'package:sigset_xtc/pages/payment_page.dart';
import 'package:sigset_xtc/pages/report_page.dart';
import 'package:sigset_xtc/pages/training_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Raleway',
          textTheme:
              const TextTheme(bodyMedium: TextStyle(fontFamily: "Raleway"))),
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        "/home": (context) => const HomePage(),
        "/membership": (context) => const MembershipPage(),
        "/nutrition": (context) => const NutritionPage(),
        "/payment": (context) => const PaymentPage(),
        "/reports": (context) => const ReportPage(),
        "/training": (context) => const TrainingPage(),
      },
    );
  }
}
