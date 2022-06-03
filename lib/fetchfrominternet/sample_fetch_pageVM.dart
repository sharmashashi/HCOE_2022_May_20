import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:http/http.dart' as http;

class SampleFetchPageViewModel extends GetxController {
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  String _data = "Empty!";
  String get data => _data;

  fetchData() async {
    final url = "https://jsonplaceholder.typicode.com/todos/1";
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    
    _data = response.body + response.statusCode.toString();
    update();
  }
}
