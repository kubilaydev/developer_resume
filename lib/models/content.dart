import 'dart:convert';

import 'package:flutter/services.dart';

///
class Content {
  ///
  Future<Map<String, dynamic>> getTextContent() async {
    final response = await rootBundle.loadString('assets/json/content.json');

    final data = await json.decode(response);
    print(data);

    return data;
  }
}
