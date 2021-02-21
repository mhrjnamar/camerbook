



import 'package:firebase_auth/firebase_auth.dart';

String ReadUserId() {

  FirebaseAuth auth= FirebaseAuth.instance;
   String uid = auth.currentUser.uid.toString();
  return uid;
}