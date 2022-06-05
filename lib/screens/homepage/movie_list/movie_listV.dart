import 'package:firstapp/screens/homepage/movie_list/movie_cardV.dart';
import 'package:firstapp/screens/homepage/movie_list/movie_listVM.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieList extends StatelessWidget {
  MovieList({Key? key}) : super(key: key);
  MovieListViewModel viewModel = MovieListViewModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: _genres(),
            flex: 1,
          ),
          Flexible(
            child: _list(),
            flex: 5,
          )
        ],
      ),
    );
  }

  _genres() {
    return GetBuilder<MovieListViewModel>(
        init: viewModel,
        builder: (context) {
          return Container(
              color: Colors.blue,
              height: 30,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                for (int i = 0; i < viewModel.genreList.length; i++)
                  _singleGenre(title: viewModel.genreList[i], index: i)
              ]));
        });
  }

  _singleGenre({required String title, required int index}) {
    return GestureDetector(
      onTap: () {
        viewModel.onGenreClicked();
      },
      child: Container(
          decoration: BoxDecoration(
              color: viewModel.currentGenreIndex == index
                  ? Colors.red
                  : Colors.grey.shade900),
          child: Text(title, style: TextStyle(color: Colors.white))),
    );
  }

  _list() {
    return Container(
      height: Get.height * .5,
      color: Colors.transparent,
      child: ListView(
        children: [for (int i = 0; i < 10; i++) MovieCard()],
      ),
    );
  }
}
