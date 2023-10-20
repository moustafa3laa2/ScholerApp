import 'package:flutter/material.dart';
import 'package:schooler_app/screens/login_screen.dart';

void main() {
  runApp(const ScholarApp());
}

class ScholarApp extends StatelessWidget {
  const ScholarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:false,
      home: LoginScreen(),
    );
  }
}