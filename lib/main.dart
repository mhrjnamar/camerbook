import 'package:camerbook/screens/OnBoardingScreen.dart';
import 'package:camerbook/screens/SignInAuth.dart';
import 'package:camerbook/screens/sub_screens/test.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'app/theme.dart';
import 'auth/authentication_service.dart';
import 'backend/backend.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          Provider<Backend>(
            create: (_) => Backend(),
          ),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
          ),
        ],
        child: MaterialApp(

          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          title: 'Flutter Demo',
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/login': (context) => FutureBuilder(
                  future: _initialization,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      print('You have an error! ${snapshot.error.toString()}');
                      return Text('Something went wrong!');
                    } else if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return AuthenticationWrapper();
                    }
                  },
                ),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/signup': (context) => FutureBuilder(
                  future: _initialization,
                  builder: (context, snapshot) {
                    final data = snapshot.data;

                    if (snapshot.hasError) {
                      print('You have an error! ${snapshot.error.toString()}');
                      return Text('Something went wrong!');
                    } else {
                      return SignupWrapper();
                    }
                  },
                ),
            '/': (context) => OnBoardingScreen(),
            '/test': (context) => Test(),
          },

        ));
  }
}
