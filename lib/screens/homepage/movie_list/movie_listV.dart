import 'package:firstapp/screens/homepage/movie_list/movie_cardV.dart';
import 'package:firstapp/screens/homepage/movie_list/movie_listVM.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieList extends StatelessWidget {
  MovieList({Key? key}) : super(key: key);
  MovieListViewModel viewModel = MovieListViewModel();
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        _genres(),
        _list(),
      ],
    );
  }

  _genres() {
    return GetBuilder<MovieListViewModel>(
        init: viewModel,
        builder: (_) {
          return Container(
              alignment: Alignment.center,
              height: 30,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                for (String each in viewModel.genreList)
                  _singleGenre(index: viewModel.genreList.indexOf(each))

                // for (int i = 0; i < viewModel.genreList.length; i++)
                //   _singleGenre(title: viewModel.genreList[i], index: i)
              ]));
        });
  }

  _singleGenre({required int index}) {
    return GestureDetector(
      onTap: () {
        viewModel.onGenreClicked(index);
      },
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: viewModel.currentGenreIndex == index
                  ? Colors.red
                  : Colors.grey.shade700),
          child: Text(viewModel.genreList[index],
              style: TextStyle(color: Colors.white))),
    );
  }

  _list() {
    return GetBuilder<MovieListViewModel>(
        init: viewModel,
        builder: (_) {
          return Expanded(
            child: ListView(
              children: [
                for (var each in viewModel.movieList)
                  MovieCard(
                    title: each['title'],
                    duration: each['runtime'].toString(),
                    imageUrl: each['medium_cover_image'],
                    rating: each['rating'].toString(),
                    year: each['year'].toString(),
                  )
              ],
            ),
          );
        });
  }
}
