import 'package:joybox/app/data/model/remote/user.dart';
import 'package:joybox/app/data/source/remote/remote_source.dart';
import 'package:get/get.dart';

class UserRepository {
  Future<User> getMe() {
    return Get.find<RemoteSource>().userService.getMe();
  }
}
