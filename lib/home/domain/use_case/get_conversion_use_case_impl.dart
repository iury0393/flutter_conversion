import 'package:flutter_conversion/home/data/repositories/get_conversion_repository_impl.dart';
import 'package:flutter_conversion/home/domain/model/conversion_model.dart';
import 'package:flutter_conversion/home/domain/use_case/get_conversion_use_case.dart';

class GetConversionUseCaseImpl implements GetConversionUseCase {
  final GetConversionRepositoryImpl getConversionRepositoryImpl;
  GetConversionUseCaseImpl({required this.getConversionRepositoryImpl});
  @override
  Future<ConversionModel> getConversion(String moeda) {
    return getConversionRepositoryImpl.getConversion(moeda);
  }
}
