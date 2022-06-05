import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Colors.transparent,
        height: Get.height * .3,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_title(), _movieList()],
        ));
  }

  _title() {
    return Text("Coming Soon",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16));
  }

  _movieList() {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < 10; i++)
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "assets/pumdikot.png",
              ),
            )
        ],
      ),
    );
  }
}
