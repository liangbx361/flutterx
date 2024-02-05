import 'package:joybox/app/core/logger/app_logger.dart';
import 'package:joybox/app/modules/player/player_interface.dart';
import 'package:joybox/app/values/app_config.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';

class PlayerControllerImpl extends GetxController implements PlayerController {
  late Player _player;

  @override
  void onInit() {
    _initPlayer();
    super.onInit();
  }

  @override
  void onClose() {
    _player.dispose();
    super.onClose();
  }

  void _initPlayer() {
    PlayerConfiguration configuration = PlayerConfiguration(
      title: AppConfig.appName,
      logLevel: AppLogger.instance.debug() ? MPVLogLevel.debug : MPVLogLevel.error,
      ready: () {
        AppLogger.instance.d('Player is ready');
      },
    );
    _player = Player(configuration: configuration);
  }
}
