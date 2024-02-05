import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:joybox/app/core/logger/app_logger.dart';
import 'package:joybox/app/data/source/remote/user_api.dart';

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
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );

    _dio = Dio(options);
    _dio.interceptors.add(AuthInterceptor());
    if (AppLogger.instance.debug()) {
      _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }

    _dio.httpClientAdapter = Http2Adapter(
      ConnectionManager(
        idleTimeout: const Duration(seconds: 10),
      ),
    );

    _userApi = UserApiImpl(_dio);
  }

  @override
  UserApi get userService => _userApi;
}
