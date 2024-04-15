import 'package:flutter_conversion/home/data/data_source/get_conversion_data_source.dart';
import 'package:flutter_conversion/home/domain/model/conversion_model.dart';
import 'package:flutter_conversion/home/domain/repositories/get_conversion_repository.dart';

class GetConversionRepositoryImpl implements GetConversionRepository {
  final GetConversionDataSource getConversionDataSource;
  GetConversionRepositoryImpl({required this.getConversionDataSource});

  @override
  Future<ConversionModel> getConversion(String moeda) {
    throw UnimplementedError();
  }
}
