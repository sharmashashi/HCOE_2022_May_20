import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstapp/screens/login/loginV.dart';
import 'package:firstapp/screens/notepage/note_pageV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    routes: {
      "/login": (context) => Login(),
      "/notepage": (context) => NotePage()
    },
    home: FirebaseAuth.instance.currentUser == null ? Login() : NotePage(),
  ));
}
