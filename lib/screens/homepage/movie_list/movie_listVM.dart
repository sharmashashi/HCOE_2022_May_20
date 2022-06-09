import 'package:firstapp/api/api.dart';
import 'package:firstapp/models/list_movie_model.dart';
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

  List<SingleMoiveModel> movieList = [];

  fetchMovies() async {
    movieList.clear();
    update();
    var result = await Api.listMovies(
        genre: genreList[_currentGenreIndex], page: _pageNumber);
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

    update();
  }

  int _currentGenreIndex = 0;

  int get currentGenreIndex => _currentGenreIndex;

  onGenreClicked(int index) {
    _currentGenreIndex = index;
    update();
    fetchMovies();
  }

  int _pageNumber = 1;
  int get pageNumber => _pageNumber;

  void onPrevClicked() {
    if (_pageNumber > 1) {
      _pageNumber--;
      fetchMovies();
    }
  }

  void onNextClicked() {
    _pageNumber++;
    fetchMovies();
  }
}
