// Import the firebase_core and cloud_firestore plugin

import 'package:camerbook/model/ProfessionModel.dart';
import 'package:camerbook/model/ServiceModel.dart';
import 'package:camerbook/model/UserModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Backend{


  Backend();


    CollectionReference professionals = FirebaseFirestore.instance.collection('professional');
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference services = FirebaseFirestore.instance.collection('Services');

    Future<String> addProfessional(ProfessionModel data) async {
      // Call the user's CollectionReference to add a new user
      try {
        await professionals
            .add(data.toMap())//model mapping
            .then((value) => print("Professional Added"));
      } on FirebaseException catch (e) {
        print(e.stackTrace);
        return e.message;
      }
    }

      Future<String> addUser(UserModel data) async{

        // Call the user's CollectionReference to add a new user
        try{
          await users
              .add( data.toMap())
              .then((value) => print("User Added"));
        }on FirebaseException catch(e){
          print(e.stackTrace);
          return e.message;
        }
    }

      Future<String> addService(ServiceModel data) async{
        try{
              await services
              .add(data.toMap());
        }on FirebaseException catch(e){
              print(e.stackTrace);
              return e.message;
        }

      }




}