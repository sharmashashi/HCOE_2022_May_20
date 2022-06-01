import 'package:firstapp/counter_app/counter_appV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dateTime = "Empty!";

  @override
  void initState() {
    saveDateTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(CounterApp());
          },
          child: Icon(Icons.arrow_forward)
        ),
        appBar: AppBar(
          title: Text("Home Page"),
          actions: [
            OutlinedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                getAndDisplayDateTime();
              },
              child: Text(
                "Date & Time",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: _body());
  }

  Widget _body() {
    return Center(
      child: Text("Last Opened at: $dateTime"),
    );
  }

  saveDateTime() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    DateTime currentDate = DateTime.now();
    String stringDateTime = currentDate.toIso8601String();

    await pref.setString("currentDateTime", stringDateTime);
  }

  getAndDisplayDateTime() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String savedDateTime = pref.getString("currentDateTime").toString();

    DateTime date = DateTime.parse(savedDateTime);

    setState(() {
      dateTime = date.hour.toString() + " : " + date.minute.toString();
    });
  }
}
