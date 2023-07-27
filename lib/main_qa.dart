import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutterx/app/data/enums/env_enums.dart';

import 'app.dart';
 
void main() async {
  await dotenv.load(fileName: ".env");

  FlavorConfig(
    name: Env.qa.toString(),
    variables: {
      "apiBaseUrl": dotenv.env["QA_API_BASE_URL"],
      "apiKey": dotenv.env["QA_API_KEY"],
    },
  );

  runApp(const App());
}