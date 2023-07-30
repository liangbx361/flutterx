import 'package:flutterx/app/data/model/user.dart';
import 'package:flutterx/app/data/source/remote/remote_source.dart';
import 'package:get/get.dart';

class UserRepository {
  
  User getMe() {
    return Get.find()<RemoteSource>().userService.getMe();
  }
}