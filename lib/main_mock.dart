import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutterx/app/data/enums/env_enum.dart';

import 'app.dart';
 
void main() async {
  await dotenv.load(fileName: ".env");

  FlavorConfig(
    name: EnvEnum.mock.toString(),
    variables: {
      "apiBaseUrl": "",
      "apiKey": "",
    },
  );

  runApp(const App());
}