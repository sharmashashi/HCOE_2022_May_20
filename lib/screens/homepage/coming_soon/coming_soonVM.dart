import 'package:firstapp/api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ComingSoonViewModel extends GetxController {
  @override
  void onInit() {
    _fetchMovies();
    super.onInit();
  }

  List<String> _imageList = [];
  List<String> get imageList => _imageList;

  _fetchMovies() async {
    _enableLoading();
    var result = await Api.listMovies();

    List movieList = result['data']['movies'];

    for (var each in movieList) {
      // String singleImage = each['medium_cover_image'];
      _imageList.add(each['medium_cover_image']);
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
