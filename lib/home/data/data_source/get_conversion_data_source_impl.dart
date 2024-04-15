import 'package:flutter_conversion/home/data/data_source/get_conversion_data_source.dart';
import 'package:flutter_conversion/home/domain/model/conversion_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_conversion/shared/utils.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';

class GetConversionDataSourceImpl implements GetConversionDataSource {
  final Dio _http;
  GetConversionDataSourceImpl(this._http);

  @override
  Future<ConversionModel> getConversion(String moeda) async {
    try {
      _http.interceptors.add(AwesomeDioInterceptor());
      Response response;
      response = await _http.get('$kBaseURL/$moeda-BRL/1');
      kLogger.d(response.data);
      return ConversionModel().fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      kLogger.e(e);
      throw Exception();
    }
  }
}
