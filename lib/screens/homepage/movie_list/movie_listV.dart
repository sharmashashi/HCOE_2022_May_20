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
                    model: each,
                  ),
                _pageNumber()
              ],
            ),
          );
      });
  }

  _pageNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _pageNumberBtn("Prev", BUTTON_TYPE.PREV,onPressed: viewModel.onPrevClicked),
        Text(viewModel.pageNumber.toString(), style: TextStyle(color: Colors.white, fontSize: 16)),
        _pageNumberBtn("Next", BUTTON_TYPE.NEXT,onPressed: viewModel.onNextClicked)
      ],
    );
  }

  _pageNumberBtn(String btnName, BUTTON_TYPE btnType,
      {required Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(2)),
          child: Row(
            children: [
              btnType == BUTTON_TYPE.PREV
                  ? Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                    )
                  : SizedBox(),
              Text(
                btnName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              btnType == BUTTON_TYPE.NEXT
                  ? Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

enum BUTTON_TYPE { PREV, NEXT }
