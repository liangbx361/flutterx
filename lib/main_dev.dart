import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutterx/app/core/logger/easy_logger.dart';
import 'package:flutterx/app/data/enums/env_enum.dart';

import 'app.dart';
 
void main() async {
  await dotenv.load(fileName: ".env");

  FlavorConfig(
    name: EnvEnum.dev.toString(),
    variables: {
      "apiBaseUrl": dotenv.env["DEV_API_BASE_URL"],
      "apiKey": dotenv.env["DEV_API_KEY"],
    },
  );

  runApp(const App());
}