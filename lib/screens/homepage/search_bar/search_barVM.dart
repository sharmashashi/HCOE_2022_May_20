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
      fetchMovies();
    } else {
      _showSuggestion = false;
      update();
    }
  }

  fetchMovies() async {
    _enableLoading();
    await Future.delayed(Duration(seconds: 3));
    
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
