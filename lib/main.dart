import 'package:auth_test/acceuil.dart';
import 'package:auth_test/firebase_options.dart';
import 'package:auth_test/form2.dart';
import 'package:auth_test/formulaire.dart';
import 'package:auth_test/otp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  options:DefaultFirebaseOptions.currentPlatform;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Formulaire2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
