import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_conversion/shared/utils.dart';

class CustomDio {
  final Dio dio;
  CustomDio(this.dio) {
    dio.options.baseUrl = kBaseURL;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.interceptors.add(AwesomeDioInterceptor());
  }

  Future<Response> getCustom(String path) async {
    Response response;
    response = await dio.get(
      path,
      onReceiveProgress: (int sent, int total) {
        kLogger.d('$sent $total');
      },
    );
    kLogger.i(response.data);
    return response;
  }
}
