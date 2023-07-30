import 'package:dio/dio.dart';

import '../../model/user.dart';
import 'api_path.dart';

abstract class UserApi {
  Future<User> getMe();
}

class UserServiceImpl extends UserApi {

  final Dio _dio;

  UserServiceImpl(this._dio);
  
  @override
  Future<User> getMe() async {
    final response = await _dio.get(ApiPath.me);
    return User.fromJson(response.data);
  }
}
