import 'package:flutter_conversion/dependency_injection.dart';
import 'package:flutter_conversion/home/domain/model/conversion_model.dart';
import 'package:flutter_conversion/home/domain/use_case/get_conversion_use_case.dart';
import 'package:flutter_conversion/home/domain/use_case/get_conversion_use_case_impl.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetConversionUseCase _getConversionUseCase = getIt<GetConversionUseCaseImpl>();

  @observable
  String selectedValueFromDropdown = '';

  @action
  String setDropDownValue(String value) => selectedValueFromDropdown = value;

  @action
  Future<ConversionModel> getConversion() async {
    final ConversionModel data = await _getConversionUseCase.getConversion('USD');
    return data;
  }
}
