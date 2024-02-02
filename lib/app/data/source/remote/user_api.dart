import 'package:dio/dio.dart';
import 'package:flutterx/app/data/model/remote/user.dart';
import 'package:flutterx/app/core/util/mock_loader.dart';

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

class UserApiMockImpl extends UserApi {
  @override
  Future<User> getMe() {
    return MockLoader.load('me')
        .then((value) => Result<User>.fromJson(value, (json) => User.fromJson(json as Map<String, dynamic>)).data!);
  }
}
