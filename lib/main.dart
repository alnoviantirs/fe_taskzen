import 'package:todo_apps/ui/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'ui/screen/login_page.dart';
import 'ui/screen/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SimpleOnboardingPage(),
    );
  }
}
