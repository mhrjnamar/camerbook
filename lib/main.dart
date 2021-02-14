import 'package:camerbook/screens/SignInAuth.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
  Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return SignInAuth();

  }
}
