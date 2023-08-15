import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(BaseOptions(
          baseUrl: 'http://10.0.2.2:3000',
          connectTimeout: 5000,
          receiveTimeout: 6000,
        )) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }
}
