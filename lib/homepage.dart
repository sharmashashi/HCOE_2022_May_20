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
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                border: OutlineInputBorder()),
          ),
          TextButton(
            onLongPress: () {
              print("On long press");
            },
            onPressed: onFlatButtonPressed,
            child: Text("Flat Button", style: TextStyle(color: Colors.white)),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple)),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Elevated Button"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
            ),
          ),

          // Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),child: Text("This is some another text"),)

          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            height: 150,
            width: 150,
            alignment: Alignment.topLeft,
            child: Text("Hello there"),
            decoration: BoxDecoration(color: Colors.blue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20)
            )
            // shape: BoxShape.circle
            ),
          )
        ],
      ),
      // ),
    );
  }

  void onFlatButtonPressed() {
    print("Text Button Clicked");
  }
}
