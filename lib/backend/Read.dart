



import 'package:firebase_auth/firebase_auth.dart';

String readUserId() {

  FirebaseAuth auth= FirebaseAuth.instance;
   String uid = auth.currentUser.uid.toString();
  return uid;
}
String userEmail(){
  FirebaseAuth auth= FirebaseAuth.instance;
  String email = auth.currentUser.email.toString();
  return email;
}