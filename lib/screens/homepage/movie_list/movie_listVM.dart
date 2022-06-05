import 'package:get/get_state_manager/get_state_manager.dart';

class MovieListViewModel extends GetxController {
  final List<String> genreList = ["Action, Comedy, Romance, Sci-fi, Adventure"];

  int _currentGenreIndex = 0;

  int get currentGenreIndex => _currentGenreIndex;

  onGenreClicked(){
    
  }
}
