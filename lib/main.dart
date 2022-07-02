import 'package:firstapp/screens/homepage/homepageV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(GetMaterialApp(
    routes: {"/homepage": (context) => HomePage()},
    home: HomePage(),
  ));
}
