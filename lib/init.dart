import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:joybox/app/app.dart';
import 'package:media_kit/media_kit.dart';

void init(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();

  await dotenv.load(fileName: ".env");
  FlavorConfig(
    name: env,
    variables: {
      "apiBaseUrl": dotenv.env["${env.toUpperCase()}_API_BASE_URL"],
      "apiKey": dotenv.env["${env.toUpperCase()}_API_KEY"],
    },
  );

  runApp(const App());
}
