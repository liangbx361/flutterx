import 'package:dio/dio.dart';

import '../../model/user.dart';
import 'api_path.dart';

abstract class UserService {
  Future<User> getMe();
}

class UserServiceImpl extends UserService {

  final Dio _dio;

  UserServiceImpl(this._dio);
  
  @override
  Future<User> getMe() async {
    final response = await _dio.get(ApiPath.me);
    return User.fromJson(response.data);
  }
}
