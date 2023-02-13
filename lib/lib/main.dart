import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'app/app.dart';
import 'firebase_options.dart';

bool shouldUseFirebaseEmulator = true;
void main() async {
  //WidgetFlutterBinding ал Flutter кыймылдаткычы менен иштешүү үчүн колдонулат.
  //Firebase.initializeApp()Firebaseди инициализациялоо үчүн түпнуска кодду
  //чалуу керек жана плагин түпнуска кодду чакыруу үчүн платформа каналдарын
  // колдонушу керек болгондуктан, ал асинхрондуу түрдө аткарылат, ошондуктан
  //ensureInitialized()сизде WidgetsBinding.

  // // Flutter проектиге Firebaseти инициализациялоо
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (shouldUseFirebaseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }

  runApp(const MyApp());
}
