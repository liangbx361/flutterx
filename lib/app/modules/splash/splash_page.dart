import 'package:flutter/material.dart';
import 'package:flutterx/generated/locales.g.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(LocaleKeys.hello.tr),
      ),
    );
  }
}
