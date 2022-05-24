import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  String textData = "Hello flutter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      // body: Center(
      // child: Text(textData,
      // style: TextStyle(
      //   fontSize: 50,
      //   color: Colors.blue
      // ),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("String 1"),
          Text("String 2"),
          Text("String3"),
          Text("String4"),
        ],
      ),
      // ),
    );
  }

  String getTextData() {
    return textData;
  }
}

