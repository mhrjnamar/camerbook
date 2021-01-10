import 'package:camerbook/auth/authentication_service.dart';
import 'package:camerbook/screens/HomeScreen.dart';
import 'package:camerbook/screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';



import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


class SignInAuth extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_)=> AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<AuthenticationService>().authStateChanges,
          ),
        ],
        child:  MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            primarySwatch: Colors.blue,

            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home:  FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('You have an error! ${snapshot.error.toString()}');
                return Text('Something went wrong!');
              } else if (snapshot.hasData) {
                return   AuthenticationWrapper();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),


        )
    );



  }
}

class AuthenticationWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null){
      return HomeScreen();
    }
    return LoginScreen();
  }}