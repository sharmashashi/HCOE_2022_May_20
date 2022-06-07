import 'package:firstapp/api/api.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MovieListViewModel extends GetxController {
  final List<String> genreList = [
    "Action",
    "Comedy",
    "Romance",
    "Sci-Fi",
    "Adventure",
    "Drama",
    "Horror"
  ];

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  List movieList = [];

  fetchMovies() async {
    var result = await Api.listMovies(genre: genreList[_currentGenreIndex]);
    movieList = result['data']['movies'];
    update();
  }

  int _currentGenreIndex = 0;

  int get currentGenreIndex => _currentGenreIndex;

  onGenreClicked(int index) {
    _currentGenreIndex = index;
    update();
    fetchMovies();
  }
}
