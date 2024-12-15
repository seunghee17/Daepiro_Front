import 'package:intl/intl.dart';

// "2024-12-15T18:08:00" 형식의 String을 yyyy-mm-dd 형태로 변환
String formatDateToHyphen(String date) {
  DateTime parsedDate = DateTime.parse(date);
  String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
  return formattedDate;
}

// "2024-12-15T18:08:00" 형식의 String을 yyyy.mm.dd 형태로 변환
String formatDateToDot(String date) {
  DateTime parsedDate = DateTime.parse(date);
  String formattedDate = DateFormat('yyyy.MM.dd').format(parsedDate);
  return formattedDate;
}
