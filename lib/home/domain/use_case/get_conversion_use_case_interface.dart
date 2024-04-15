import 'package:flutter_conversion/home/domain/model/conversion_model.dart';

abstract class GetConversionUseCaseInterface {
  Future<ConversionModel> getConversion(String moeda);
}
