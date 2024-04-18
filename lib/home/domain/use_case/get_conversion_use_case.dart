import 'package:flutter_conversion/home/domain/model/conversion_model.dart';

abstract class GetConversionUseCase {
  Future<ConversionModel> getConversion(String moeda);
}
