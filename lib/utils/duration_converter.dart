

String minutesToHourMinutes(int minutes) {
  String retVal = "";
  int minute = minutes % 60;
  int hour = minutes ~/ 60;

  retVal = "$hour hr $minute min";
  return retVal;
}
