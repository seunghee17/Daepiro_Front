import 'package:flutter/services.dart';

class StringHelper {
  static late String infoTermText;
  static late String usingTermText;
  static late String locationTermText;

  static Future<void> initialize() async {
    final infoText = await Future.wait([
      rootBundle.loadString('assets/texts/info_terms.txt')
    ]);
    infoTermText = infoText[0];

    final usingText = await Future.wait([
      rootBundle.loadString('assets/texts/using_terms.txt')
    ]);
    usingTermText = usingText[0];

    final locationText = await Future.wait([
      rootBundle.loadString('assets/texts/location_service_terms.txt')
    ]);
    locationTermText = locationText[0];
  }

  StringHelper._();
}