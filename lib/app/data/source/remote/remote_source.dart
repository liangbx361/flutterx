import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutterx/app/data/source/remote/user_service.dart';

import 'interceptor/auth_interceptor.dart';

abstract class RemoteSource {
  UserService get getUserService;
}

class RemoteSourceImpl extends RemoteSource {
  late final Dio _dio;
  late final UserService _userService;

  RemoteSourceImpl() {
    BaseOptions options = BaseOptions(
      baseUrl: FlavorConfig.instance.variables['apiBaseUrl'],
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );

    _dio = Dio(options);
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _userService = UserServiceImpl(_dio);
  }

  @override
  UserService get getUserService => _userService;
}
