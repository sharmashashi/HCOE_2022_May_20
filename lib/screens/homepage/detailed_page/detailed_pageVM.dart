import 'package:firstapp/api/api.dart';
import 'package:firstapp/models/cast_model.dart';
import 'package:firstapp/models/list_movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetailedPageViewModel extends GetxController {
  // @override
  // void onInit() {
  //   // fetchMovieDetails();
  //   super.onInit();
  // }
  final SingleMoiveModel model;
  DetailedPageViewModel(this.model) {
    fetchMovieDetails();
  }
  List<CastModel> _castModelList = [];
  List<CastModel> get castModelList => _castModelList;
  fetchMovieDetails() async {
    _enableLoading();
    var result = await Api.getMovieDetails(model.id, true);

    Map movie = result['data']['movie'];

    List cast = movie.containsKey("cast") ? movie['cast'] : [];
    for (var each in cast) {
      _castModelList.add(CastModel(
          actorName: each['name'],
          characterName: each['character_name'],
          photo: each['url_small_image']));
    }
    _disableLoading();
  }

  Widget _loading = SizedBox();
  Widget get loading => _loading;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  _enableLoading() {
    _isLoading = true;
    _loading = Center(
      child: CircularProgressIndicator(),
    );
    update();
  }

  _disableLoading() {
    _isLoading = false;
    _loading = SizedBox();
    update();
  }
}

// void main() {
//   Map map = {"phone": 989898989};
//   try {
//     int name = map['name'];
//   } catch (error) {
//     print("Error: ${error.toString()}");
//   }
// }
