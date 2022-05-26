import 'package:flutter/material.dart';

class DetailedPage extends StatelessWidget {
  const DetailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detailed Page"),
      ),
      body: Column(
        children: [
          _backButton(context)
          // Center(
          //     child: ElevatedButton(
          //   child: Text("Go Back"),
          //   onPressed: () {
          //     // Navigator.of(context).pop();
          //     Navigator.pop(context);
          //   },
          // )),
        ],
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(20),
        child: Text("Go Back"),
        color: Colors.blue,
      ),
    );
  }
}
