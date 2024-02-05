import 'package:flutter/widgets.dart';

abstract class PlayerView {
  Widget buildPlayer(BuildContext context);
}

abstract class PlayerController {
  void play();
  void pause();
}
