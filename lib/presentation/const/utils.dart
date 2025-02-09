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
  if (date.isEmpty) return "";

  DateTime parsedDate = DateTime.parse(date);
  String formattedDate = DateFormat('yyyy.MM.dd').format(parsedDate);
  return formattedDate;
}

// "2024-12-15T18:08:00" 형식의 String을 yyyy.mm.dd hh:mm형태로 변환
String formatDateToDateTime(String date) {
  if (date.isEmpty) return "";

  DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat("yyyy.MM.dd HH:mm").format(dateTime);

  return formattedDate;
}

// "2024-12-15T18:08:00" 형식의 String을 D-13 형태로 변환
String calculateDaysDiff(String date) {
  if (date.isEmpty) return "상시";

  DateTime parsedDate = DateTime.parse(date);
  DateTime now = DateTime.now();

  DateTime parsedDateOnly = DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
  DateTime nowDateOnly = DateTime(now.year, now.month, now.day);

  int difference = nowDateOnly.difference(parsedDateOnly).inDays;

  // D-day 형식으로 반환
  if (difference == 0) {
    return "D-0";
  } else if (difference > 0) {
    return "D+$difference"; // 과거
  } else {
    return "D${difference}"; // 미래
  }
}

// "2024-12-15T18:08:00" 형식의 String을 n분 전 형태로 변환
String timeAgo(String date) {
  DateTime past = DateTime.parse(date).toLocal();
  Duration difference = DateTime.now().difference(past);

  if (difference.inMinutes < 1) {
    return "방금전";
  } else if (difference.inMinutes < 60) {
    return "${difference.inMinutes}분전";
  } else if (difference.inHours < 24) {
    return "${difference.inHours}시간전";
  } else {
    return "${difference.inDays}일전";
  }
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