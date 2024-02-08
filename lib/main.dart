import 'package:flutter/material.dart';

import 'package:posthub/onboard.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'logo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCZh7f_lgIQk-NcuU4umKMwOJzeD372wjc",
      appId: "1:333564332457:android:31fddac80c30df48fadcb8",
      messagingSenderId: "333564332457",
      projectId: "posthub-caa0a",
    ),
  );

  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,

      home:Logo() ,
    );
  }
}

