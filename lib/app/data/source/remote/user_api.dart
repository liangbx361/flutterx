import 'package:dio/dio.dart';
import 'package:joybox/app/data/model/remote/user.dart';

import 'api_path.dart';

abstract class UserApi {
  Future<User> getMe();
}

class UserApiImpl extends UserApi {
  final Dio _dio;

  UserApiImpl(this._dio);

  @override
  Future<User> getMe() async {
    final response = await _dio.get(ApiPath.me);
    return User.fromJson(response.data as Map<String, dynamic>);
  }
}
