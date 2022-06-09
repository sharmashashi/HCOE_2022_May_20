import 'package:firstapp/api/api.dart';
import 'package:firstapp/models/list_movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SearchBarViewModel extends GetxController {
  final TextEditingController fieldController = TextEditingController();

  bool _showSuggestion = false;
  bool get showSuggestion => _showSuggestion;

  void onChanged(String value) {
    if (value.isNotEmpty) {
      _showSuggestion = true;
      update();
      fetchMovies(value);
    } else {
      _showSuggestion = false;
      update();
    }
  }

  List movieList = [];
  fetchMovies(String queryTerm) async {
    _enableLoading();
    var result = await Api.searchMovies(queryTerm);
   
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

  Widget _loadingSuggestion = SizedBox();
  Widget get loadingSuggestion => _loadingSuggestion;

  _enableLoading() {
    _loadingSuggestion = Center(child: LinearProgressIndicator());
    update();
  }

  _disableLoading() {
    _loadingSuggestion = SizedBox();
    update();
  }
}
