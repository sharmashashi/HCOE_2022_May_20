import 'package:firstapp/screens/homepage/coming_soon/coming_soonV.dart';
import 'package:firstapp/screens/homepage/movie_list/movie_listV.dart';
import 'package:firstapp/screens/homepage/search_bar/search_barV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final searchBarHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: Container(),
      ),
      body: _body(),
    );
  }

  _body() {
    return Stack(
      children: [
        Positioned(
          // top: searchBarHeight,
          child: SizedBox(
            width: Get.width,
            height: Get.height - searchBarHeight,
            child: Column(
              children: [
                SizedBox(height: searchBarHeight),
                ComingSoon(),
                Expanded(child: MovieList())
              ],
            ),
          ),
        ),
        SearchBar(
          height: searchBarHeight,
        )
      ],
    );
  }
}
