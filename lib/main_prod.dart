import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutterx/app/data/enum/env_enum.dart';

import 'app.dart';
 
void main() async {
  await dotenv.load(fileName: ".env");

  FlavorConfig(
    name: EnvEnum.prod.toString(),
    variables: {
      "apiBaseUrl": dotenv.env["PROD_API_BASE_URL"],
      "apiKey": dotenv.env["PROD_API_KEY"],
    },
  );

  runApp(const App());
}