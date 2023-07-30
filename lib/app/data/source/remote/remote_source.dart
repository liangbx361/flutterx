import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutterx/app/data/source/remote/user_api.dart';

import 'interceptor/auth_interceptor.dart';

abstract class RemoteSource {
  UserApi get userService;
}

class RemoteSourceImpl extends RemoteSource {
  late final Dio _dio;
  late final UserApi _userApi;

  RemoteSourceImpl() {
    BaseOptions options = BaseOptions(
      baseUrl: FlavorConfig.instance.variables['apiBaseUrl'],
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );

    _dio = Dio(options);
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _userApi = UserServiceImpl(_dio);
  }

  @override
  UserApi get userService => _userApi;
}
