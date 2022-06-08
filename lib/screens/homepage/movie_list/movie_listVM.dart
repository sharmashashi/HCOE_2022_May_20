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
    var result = await Api.listMovies(genre: genreList[_currentGenreIndex]);
    List _tempList = result['data']['movies'];

    for (var each in _tempList) {
      SingleMoiveModel object = SingleMoiveModel(
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
}
