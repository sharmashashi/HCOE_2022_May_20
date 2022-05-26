import 'package:firstapp/detailedpage.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _fieldController = TextEditingController();
  String _inputText = "Empty!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Page"),
        leading: Icon(Icons.arrow_back),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _fieldController,
          decoration: InputDecoration(hintText: "Type Here"),
        ),
        ElevatedButton(
            onPressed: () {
              // print("clicked this button");
              _inputText = _fieldController.text;
              setState(() {});
              print(_inputText);
            },
            child: Text("Click Here")),
        Text(_inputText),
        _likeButton(),
        _detailedPageButton(context)
      ],
    );
  }

  Widget _detailedPageButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DetailedPage();
          }));
        },
        icon: Icon(Icons.arrow_forward));
  }

  Widget _likeButton() {
    return LikeButton(
      // onTap: (value){

      // },
      bubblesSize: 500,
    );
  }
}
