import 'package:firstapp/models/list_movie_model.dart';
import 'package:firstapp/screens/homepage/detailed_page/detailed_pageV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieCard extends StatelessWidget {
  final SingleMoiveModel model;
  MovieCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailedPage(
          model: model,
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        height: 100,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade700,
        ),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(model.imageUrl),
          ),
          _movieInfo()
        ]),
      ),
    );
  }

  _movieInfo() {
    final TextStyle style = TextStyle(color: Colors.white, fontSize: 12);
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text(
              "Rating: ${model.rating}",
              style: style,
            ),
            Text(
              "${model.runTime} Min",
              style: style,
            ),
            Text(
              "Year: ${model.year}",
              style: style,
            )
          ],
        ),
      ),
    );
  }
}
