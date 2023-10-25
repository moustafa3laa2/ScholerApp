import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:schooler_app/firebase_options.dart';
import 'package:schooler_app/screens/login_screen.dart';
import 'package:schooler_app/screens/register_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarApp());
}

class ScholarApp extends StatelessWidget {
  const ScholarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        LoginScreen.id :(context) =>  LoginScreen(),
        RegisterScreen.id : (context) =>  RegisterScreen(),
      },
      debugShowCheckedModeBanner:false,
      initialRoute: 'LoginScreen',
    );
  }
}