import 'package:firstapp/api/api.dart';
import 'package:firstapp/models/list_movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ComingSoonViewModel extends GetxController {
  @override
  void onInit() {
    _fetchMovies();
    super.onInit();
  }

  List<SingleMoiveModel> movieList = [];
  _fetchMovies() async {
    _enableLoading();
    var result = await Api.listMovies();

    List _tempList = result['data']['movies'];

    for (var each in _tempList) {
      SingleMoiveModel object = SingleMoiveModel(
        id: each['id'],
        title: each['title'],
        runTime: each['runtime'].toString(),
        imageUrl: each['medium_cover_image'],
        rating: each['rating'].toString(),
        year: each['year'].toString(),
        description: each['description_full'],
        genres: each['genres'],
      );
      movieList.add(object);
    }
    _disableLoading();
  }

  Widget _loading = SizedBox();
  Widget get loading => _loading;

  _enableLoading() {
    _loading = Center(
      child: CircularProgressIndicator(),
    );
    update();
  }

  _disableLoading() {
    _loading = SizedBox();
    update();
  }
}
