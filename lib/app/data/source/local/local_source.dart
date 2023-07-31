import 'package:flutterx/app/core/logger/easy_logger.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../model/user.dart';

abstract class LocalSource {

  dynamic getConfig(String key);

  void saveConfig(String key, dynamic value);

  User getUser();

  void saveUser(User user);
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
    EasyLogger().d('appDocumentDir: ${appDocumentDir.path}');

    await Hive.initFlutter(appDocumentDir.path);
    Hive.registerAdapter(UserAdapter());
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
  User getUser() {
    return userBox?.getAt(0);
  }

  @override
  void saveUser(User user) async {
    userBox?.putAt(0, user);
  }
} 