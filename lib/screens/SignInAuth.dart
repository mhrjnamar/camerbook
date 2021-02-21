import 'package:camerbook/auth/authentication_service.dart';
import 'package:camerbook/screens/HomeScreen.dart';
import 'package:camerbook/screens/LoginScreen.dart';
import 'package:camerbook/screens/OnBoardingScreen.dart';
import 'package:camerbook/screens/SignupScreen.dart';
import 'package:camerbook/screens/sub_screens/test.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInAuth extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeScreen();
    }
    return LoginScreen();
  }
}

class SignupWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeScreen();
    }
    return SignupScreen();
  }
}
