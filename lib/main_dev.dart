import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutterx/app/data/enums/env_enums.dart';

import 'app.dart';
 
void main() async {
  print("invoke main_dev.dart");

  await dotenv.load(fileName: ".env");

  FlavorConfig(
    name: Env.dev.toString(),
    variables: {
      "apiBaseUrl": dotenv.env["DEV_API_BASE_URL"],
      "apiKey": dotenv.env["DEV_API_KEY"],
    },
  );

  print(FlavorConfig.instance.name);

  runApp(const MyApp());
}