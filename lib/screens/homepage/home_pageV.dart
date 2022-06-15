import 'package:firstapp/screens/homepage/downloads/downloadsV.dart';
import 'package:firstapp/screens/homepage/movie_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<Widget> _pages = [MoviePage(), Downloads()];
  final HomePageViewModel viewModel = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(
        init: viewModel,
        builder: (_) {
          return Scaffold(
            bottomNavigationBar: _bottomNavBar(),
            body: _body(),
          );
        });
  }

  _body() {
    return _pages[viewModel.pageIndex];
  }

  _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: viewModel.pageIndex,
      onTap: (index) {
        viewModel.onNabBarItemClicked(index);
      },
      // backgroundColor: Colors.grey.shade900,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.download,
            ),
            label: "Downloads")
      ],
    );
  }
}

class HomePageViewModel extends GetxController {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  void onNabBarItemClicked(int index) {
    _pageIndex = index;
    update();
  }
}
