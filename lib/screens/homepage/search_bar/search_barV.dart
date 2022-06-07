import 'package:firstapp/screens/homepage/search_bar/search_barVM.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  final double height;
  SearchBar({Key? key, required this.height}) : super(key: key);

  final InputBorder fieldBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(1000));

  SearchBarViewModel viewModel = SearchBarViewModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchBarViewModel>(
        init: viewModel,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    viewModel.onChanged(value);
                  },
                  controller: viewModel.fieldController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      hintText: "Type movie name",
                      filled: true,
                      fillColor: Colors.grey.shade700,
                      isDense: true,
                      enabledBorder: fieldBorder,
                      focusedBorder: fieldBorder,
                      suffixIcon: IconButton(
                        color: Colors.grey,
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      )),
                ),
                viewModel.showSuggestion ? _suggestion() : SizedBox()
              ],
            ),
          );
        });
  }

  _suggestion() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: Get.width,
      height: Get.height * .3,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListView(
        children: [viewModel.loadingSuggestion],
      ),
    );
  }
}


// {
//   "status": "ok",
//   "status_message": "Query was successful",
//   "data": {
//     "movie_count": 41893,
//     "limit": 20,
//     "page_number": 1,
//     "movies": [
//       {
//         "id": 42598,
//         "url": "https://yts.mx/movies/love-struck-2014",
//         "imdb_code": "tt3909476",
//         "title": "Love Struck",
//         "title_english": "Love Struck",
//         "title_long": "Love Struck (2014)",
//         "slug": "love-struck-2014",
//         "year": 2014,
//         "rating": 6.4,
//         "runtime": 90,
//         "genres": [
//           "Comedy",
//           "Drama",
//           "Romance"
//         ],
//result = jsonDecode(response.body);
// movieList = result['data']['movies']
// movieList[0]['genres']

