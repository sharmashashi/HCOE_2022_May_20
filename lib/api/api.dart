import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static Future<Map> listMovies({String? genre, int? page}) async {
    final url = genre == null
        ? "https://yts.mx/api/v2/list_movies.json"
        : "https://yts.mx/api/v2/list_movies.json?genre=$genre&page=$page";
    Uri uri = (Uri.parse(url));
    // .replace(queryParameters: {"genre":genre});

    http.Response response = await http.get(
      uri,
    );
    var decoded = jsonDecode(response.body);
    return decoded;
  }

  static Future<Map> searchMovies(String queryTerm) async {
    final url = "https://yts.mx/api/v2/list_movies.json?query_term=$queryTerm";
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    var decoded = jsonDecode(response.body);
    return decoded;
  }

  static Future<Map> getMovieDetails(int movieId, bool withCast) async {
    final url =
        "https://yts.mx/api/v2/movie_details.json?movie_id=$movieId&with_cast=$withCast";
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    var decoded = jsonDecode(response.body);
    return decoded;
  }
}
