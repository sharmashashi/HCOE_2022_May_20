import 'package:firstapp/screens/homepage/search_bar/search_barVM.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  final InputBorder fieldBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(1000));
  
  SearchBarViewModel viewModel = SearchBarViewModel();

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}
