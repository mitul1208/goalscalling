import 'package:intl/intl.dart';

final DateFormat dateFormat = DateFormat("MM/dd/yyyy hh:mm aaa");

String getFullDateString(String date) {
  DateTime dateInDateTime = DateTime.parse(date);
  String currentDate = dateFormat.format(dateInDateTime).toString();
  return currentDate;
}
