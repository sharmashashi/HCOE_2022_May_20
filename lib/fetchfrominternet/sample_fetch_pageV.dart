import 'package:firstapp/fetchfrominternet/sample_fetch_pageVM.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SampleFetchPage extends StatelessWidget {
  SampleFetchPage({Key? key}) : super(key: key);
  final SampleFetchPageViewModel viewModel = SampleFetchPageViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: GetBuilder(
        init: viewModel,
        builder: (context) {
          return Text(viewModel.data);
        }
      ),
    );
  }
}
