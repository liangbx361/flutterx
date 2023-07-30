import 'package:flutterx/app/data/source/local/local_source.dart';
import 'package:get/instance_manager.dart';

class ConfigRepository {

  dynamic getConfig(String key) {
    return Get.find<LocalSource>().getConfig(key);
  }

  void saveConfig(String key, dynamic value) {
    Get.find<LocalSource>().saveConfig(key, value);
  }

}