import 'package:daepiro/presentation/const/common_disaster_list.dart';
import 'package:intl/intl.dart';
import 'emergency_disaster_list.dart';

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

// 재난명으로 아이콘 찾기
String findDisasterIconByName({
  required String name
}) {
  for (var item in EmergencyDisasterList + CommonDisasterList) {
    if (item["name"] == name) {
      return item["icon"] ?? "";
    }
  }

  return "";
}