import 'package:flutterx/app/data/repository/config_repository.dart';
import 'package:flutterx/app/data/source/local/local_source.dart';
import 'package:flutterx/app/data/source/remote/remote_source.dart';
import 'package:get/get.dart';

import 'app/data/repository/user_repository.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalSource>(() => LocalSourceImpl(), fenix: true);
    Get.lazyPut<RemoteSource>(() => RemoteSourceImpl(), fenix: true);
    Get.lazyPut<ConfigRepository>(() => ConfigRepository(), fenix: false);
    Get.lazyPut<UserRepository>(() => UserRepository(), fenix: false);
  }
}