import 'package:firstapp/models/list_movie_model.dart';
import 'package:firstapp/screens/homepage/detailed_page/detailed_pageV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggestionCard extends StatelessWidget {
  final SingleMoiveModel model;
  SuggestionCard({required this.model, Key? key}) : super(key: key);

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
        height: 60,
        width: Get.width,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
              color: Colors.black,
            )),
            // borderRadius: BorderRadius.circular(8),
            color: Colors.transparent),
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
    final TextStyle style = TextStyle(color: Colors.black, fontSize: 12);
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            // Text(
            //   "Rating: $rating",
            //   style: style,
            // ),
            // Text(
            //   "$duration Min",
            //   style: style,
            // ),
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
