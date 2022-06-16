import 'package:firebase_core/firebase_core.dart';
import 'package:firstapp/noteapp/homepage/homepageV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    home: HomePage(),
  ));
}
