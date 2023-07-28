import 'package:dio/dio.dart';
import 'package:flutterx/app/core/global_data.dart';

class AuthInterceptor implements InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (GlobalData().getToken != null) {
      options.headers['Authorization'] = 'Bearer ${GlobalData().getToken}';
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      GlobalData().logout();
    }
    handler.next(err);
  }
}
