import 'package:flutter_conversion/home/data/repositories/get_conversion_repository_impl.dart';
import 'package:flutter_conversion/home/domain/model/conversion_model.dart';
import 'package:flutter_conversion/home/domain/use_case/get_conversion_use_case_interface.dart';

class GetConversionUseCase implements GetConversionUseCaseInterface {
  final GetConversionRepositoryImpl _getConversionRepositoryImpl;
  GetConversionUseCase(this._getConversionRepositoryImpl);
  @override
  Future<ConversionModel> getConversion(String moeda) {
    return _getConversionRepositoryImpl.getConversion(moeda);
  }
}
