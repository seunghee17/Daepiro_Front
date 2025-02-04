import 'package:flutter/services.dart';

class StringHelper {
  static late String ruleTermText;

  static Future<void> ruleInitialize() async {
    final texts = await Future.wait([
      rootBundle.loadString('assets/texts/rule_terms.txt')
    ]);
    ruleTermText = texts[0];
  }

  StringHelper._();
}