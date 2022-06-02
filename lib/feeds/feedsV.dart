import 'package:firstapp/feeds/feed_cardV.dart';
import 'package:flutter/material.dart';

class Feeds extends StatelessWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        for(int i =0;i<10;i++)FeedCard()
      ],
    );
  }
}
