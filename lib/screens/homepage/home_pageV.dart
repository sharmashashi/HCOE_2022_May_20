import 'package:firstapp/screens/homepage/coming_soon/coming_soonV.dart';
import 'package:firstapp/screens/homepage/movie_list/movie_listV.dart';
import 'package:firstapp/screens/homepage/search_bar/search_barV.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: _appBar(),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: [ComingSoon(), MovieList()],
    );
  }

  _appBar() {
    return AppBar(
      // elevation: 0,
      backgroundColor: Colors.grey.shade900,
      title: SearchBar(),
    );
  }
}
