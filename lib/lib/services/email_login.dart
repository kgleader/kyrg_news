import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class userRegister {
  /*
   Колдонуучудан почтасын жана паролун алып файрбейзке жүктөө керек.
   Ийгиликтүү болсо GiveNews пейджке жиберүү керек андай болбосо ката деп чыгыш керек.
   Иш жүрүп жатканда лоадинг болуш керек.

   */
  Future<UserCredential?> register(String email, String password) async {
    try {
      final user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return user;
    } catch (e) {
      log('register error $e');
      return null;
    }
  }
}
