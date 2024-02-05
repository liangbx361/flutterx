import 'package:hive_flutter/hive_flutter.dart';
import 'package:joybox/app/core/logger/app_logger.dart';
import 'package:joybox/app/data/model/local/user_lm.dart';
import 'package:path_provider/path_provider.dart';

abstract class LocalSource {
  dynamic getConfig(String key);

  void saveConfig(String key, dynamic value);

  UserLm getUser();

  void saveUser(UserLm user);
}

class LocalSourceImpl implements LocalSource {
  final String configBoxName = 'config';
  final String userBoxName = 'user';

  Box? configBox;
  Box? userBox;

  LocalSourceImpl() {
    _init();
  }

  void _init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    AppLogger.instance.d('appDocumentDir: ${appDocumentDir.path}');

    await Hive.initFlutter(appDocumentDir.path);
    Hive.registerAdapter(UserLmAdapter());
    configBox = await Hive.openBox(configBoxName);
    userBox = await Hive.openBox(userBoxName);
  }

  @override
  getConfig(String key) {
    return configBox?.get(key);
  }

  @override
  void saveConfig(String key, value) {
    configBox?.put(key, value);
  }

  @override
  UserLm getUser() {
    return userBox?.getAt(0);
  }

  @override
  void saveUser(UserLm user) async {
    userBox?.putAt(0, user);
  }
}
