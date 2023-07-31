import 'dart:convert';

import 'package:flutter/services.dart';

class MockLoader {
    
    static Future<Map<String, dynamic>> load(String mockName) async {
      final jsonString = await rootBundle.loadString('assets/mocks/$mockName.json');
      return json.decode(jsonString);
    }
}