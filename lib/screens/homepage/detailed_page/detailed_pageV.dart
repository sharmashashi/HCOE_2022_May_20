import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedPage extends StatelessWidget {
  const DetailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return PreferredSize(
        child: Container(color: Colors.blue), preferredSize: Size.zero);
  }

  _body() {
    return Column(
      children: [
        _movieImage(),
        Expanded(
          child: _movieDetails(),
        )
      ],
    );
  }

  _movieImage() {
    return Container(
        color: Colors.yellow,
        height: 250,
        child: Stack(
          children: [
            Image.asset(
              "assets/pumdikot.png",
              fit: BoxFit.fill,
              height: 250,
              width: Get.width,
            ),
            Container(height: 250, color: Colors.black12),
            Positioned(
              bottom: 0,
              child: Container(
                height: 100,
                width: Get.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                      0,
                      0.5,
                      0.99
                    ],
                        colors: [
                      Colors.transparent,
                      Colors.black12,
                      Colors.black
                    ])),
              ),
            ),
            Positioned(
              left: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
                color: Colors.white,
              ),
            ),
            Positioned(
              child: Text(
                "1 h 20 m",
                style: TextStyle(color: Colors.white),
              ),
              bottom: 0,
              right: 0,
            )
          ],
        ));
  }

  _movieDetails() {
    return Container(
      width: Get.width,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_ratings(), _titleDescription(), _actors()],
      ),
    );
  }

  _titleDescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Some Title',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          Text(
            "some description",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          )
        ],
      ),
    );
  }

  _actors() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Actors",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
                  SizedBox(height: 10,),
          SizedBox(
            height: 80,
            width: Get.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < 10; i++) Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: ClipRRect(
                    borderRadius:BorderRadius.circular(8),
                    child: Image.asset("assets/ronb.png"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _ratings() {
    final TextStyle style = TextStyle(color: Colors.white, fontSize: 12);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "18+",
            style: style,
          ),
          Text(
            "Action",
            style: style,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text("5.0", style: style)
            ],
          )
        ],
      ),
    );
  }
}
