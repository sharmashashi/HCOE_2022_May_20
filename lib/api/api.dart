import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static Future<Map> listMovies({String? genre}) async {
    final url = genre == null
        ? "https://yts.mx/api/v2/list_movies.json"
        : "https://yts.mx/api/v2/list_movies.json?genre=$genre";
    Uri uri = (Uri.parse(url));
    // .replace(queryParameters: {"genre":genre});

    http.Response response = await http.get(
      uri,
    );
    var decoded = jsonDecode(response.body);
    return decoded;
  }
}
