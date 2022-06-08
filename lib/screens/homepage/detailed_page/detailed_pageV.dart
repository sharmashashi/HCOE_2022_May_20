import 'package:firstapp/models/list_movie_model.dart';
import 'package:firstapp/utils/duration_converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedPage extends StatelessWidget {
  final SingleMoiveModel model;
  DetailedPage({Key? key, required this.model}) : super(key: key);

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
            Image.network(
              model.imageUrl,
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
                minutesToHourMinutes(int.parse(model.runTime)),
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
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
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
          Text(model.title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          Text(
            model.description,
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
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 80,
            width: Get.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < 10; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
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
            model.genres.first,
            style: style,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(model.rating, style: style)
            ],
          )
        ],
      ),
    );
  }
}
