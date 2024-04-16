import 'package:dio/dio.dart';
import 'package:flutter_conversion/home/data/data_source/get_conversion_data_source.dart';
import 'package:flutter_conversion/home/data/data_source/get_conversion_data_source_impl.dart';
import 'package:flutter_conversion/home/data/repositories/get_conversion_repository_impl.dart';
import 'package:flutter_conversion/home/domain/repositories/get_conversion_repository.dart';
import 'package:flutter_conversion/home/domain/use_case/get_conversion_use_case.dart';
import 'package:flutter_conversion/home/domain/use_case/get_conversion_use_case_interface.dart';
import 'package:flutter_conversion/home/presentation/controller/home_controller.dart';
import 'package:flutter_conversion/shared/custom_dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setup() {
  //GLOBAL
  getIt.registerFactory(() => Dio());

  getIt.registerSingleton<CustomDio>(CustomDio(getIt<Dio>()));
  getIt.registerSingleton<HomeController>(HomeController());

  //REPOSITORIES
  getIt.registerSingleton<GetConversionRepositoryImpl>(GetConversionRepositoryImpl(
    getConversionDataSource: GetConversionDataSourceImpl(CustomDio(getIt<Dio>())),
  ));
  getIt.registerSingleton<GetConversionRepository>(GetConversionRepositoryImpl(
    getConversionDataSource: GetConversionDataSourceImpl(CustomDio(getIt<Dio>())),
  ));

  //USE CASE
  getIt.registerSingleton<GetConversionUseCaseInterface>(
      GetConversionUseCase(GetConversionRepositoryImpl(
    getConversionDataSource: GetConversionDataSourceImpl(CustomDio(getIt<Dio>())),
  )));
  getIt.registerSingleton<GetConversionUseCase>(GetConversionUseCase(GetConversionRepositoryImpl(
    getConversionDataSource: GetConversionDataSourceImpl(CustomDio(getIt<Dio>())),
  )));

  //DATA SOURCE
  getIt.registerSingleton<GetConversionDataSourceImpl>(
      GetConversionDataSourceImpl(CustomDio(getIt<Dio>())));
  getIt.registerSingleton<GetConversionDataSource>(
      GetConversionDataSourceImpl(CustomDio(getIt<Dio>())));
}
