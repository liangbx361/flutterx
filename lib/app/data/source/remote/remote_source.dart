import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutterx/app/data/enum/env_enum.dart';
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

    if (FlavorConfig.instance.name == EnvEnum.mock.toString()) {
      _userApi = UserApiMockImpl();
    } else {
      _userApi = UserApiImpl(_dio);
    }
  }

  @override
  UserApi get userService => _userApi;
}

class RemoteSourceMockImple extends RemoteSource {
  @override
  UserApi get userService => throw UnimplementedError();
}
