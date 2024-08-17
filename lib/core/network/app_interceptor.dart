
import 'package:benmore_amos/core/injector.dart';
import 'package:benmore_amos/core/storage_manager.dart';
import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  AppInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    StorageManager storageManager = sl<StorageManager>();
    if(storageManager.getToken() != null && storageManager.getToken() != ''){
      options.headers.addAll({"Authorization": 'Bearer ${storageManager.getToken()}',});
    }
    return super.onRequest(options, handler);
  }

    @override
    void onResponse(Response response, ResponseInterceptorHandler handler) {
      if (response.statusCode! >= 200 &&
          response.statusCode! < 400) {
        response.statusCode = 200;
      }
      return super.onResponse(response, handler);
    }
  }
