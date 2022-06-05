import 'package:firstapp/screens/homepage/detailed_page/detailed_pageV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailedPage());
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
            child: Image.asset("assets/ronb.png"),
          ),
          _movieInfo()
        ]),
      ),
    );
  }

  _movieInfo() {
    final TextStyle style = TextStyle(color: Colors.white, fontSize: 12);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Some Movie title",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text("Rating: 7.5",style: style,),
          Text("120 Min",style: style,),
          Text("Year: 2015",style: style,)
        ],
      ),
    );
  }
}
