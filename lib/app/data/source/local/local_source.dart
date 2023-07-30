import 'dart:io';

import 'package:flutterx/app/core/logger/easy_logger.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../model/user.dart';

abstract class LocalSource {

  dynamic getConfig(String key);

  void saveConfig(String key, dynamic value);

  User getUser();

  void saveUser(User user);
}

class LocalSourceImpl implements LocalSource {
  final String configBox = 'config';
  final String userBox = 'user';

  LocalSourceImpl() {
    _init();
  }

  void _init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    EasyLogger().d('appDocumentDir: ${appDocumentDir.path}');

    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(UserAdapter());
    Hive.openBox(configBox);
    Hive.openBox(userBox);
  }

  @override
  getConfig(String key) {
    return Hive.box(configBox).get(key);
  }

  @override
  void saveConfig(String key, value) {
    Hive.box(configBox).put(key, value);
  }

  @override
  User getUser() {
    return Hive.box(userBox).getAt(0);
  }

  @override
  void saveUser(User user) async {
    Hive.box(userBox).putAt(0, user);
  }
} 