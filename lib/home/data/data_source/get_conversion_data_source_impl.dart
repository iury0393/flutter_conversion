import 'package:flutter_conversion/home/data/data_source/get_conversion_data_source.dart';
import 'package:flutter_conversion/home/domain/model/conversion_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_conversion/shared/custom_dio.dart';
import 'package:flutter_conversion/shared/utils.dart';

class GetConversionDataSourceImpl implements GetConversionDataSource {
  final CustomDio dio;
  GetConversionDataSourceImpl({required this.dio});

  @override
  Future<ConversionModel> getConversion(String moeda) async {
    try {
      Response response;
      response = await dio.getCustom('/$moeda-BRL/1');
      kLogger.d(response.data);
      return ConversionModel().fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      kLogger.e(e);
      throw Exception();
    }
  }
}
