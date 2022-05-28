void main() async {
  String someData = await getSomeDataAfterSomeDelay();
  print(someData);
}

getSomeDataAfterSomeDelay() async {
  await Future.delayed(Duration(seconds: 5));
  // print("some data");

  return "Some Data";
}
