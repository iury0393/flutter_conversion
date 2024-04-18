import 'package:dio/dio.dart';
import 'package:flutter_conversion/home/data/data_source/get_conversion_data_source_impl.dart';
import 'package:flutter_conversion/home/data/repositories/get_conversion_repository_impl.dart';
import 'package:flutter_conversion/home/domain/use_case/get_conversion_use_case_impl.dart';
import 'package:flutter_conversion/shared/custom_dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setup() {
  //GLOBAL
  getIt.registerFactory(() => Dio());

  getIt.registerSingleton<CustomDio>(CustomDio(getIt<Dio>()));

  //DATA SOURCE
  getIt.registerSingleton<GetConversionDataSourceImpl>(GetConversionDataSourceImpl(
    dio: getIt<CustomDio>(),
  ));

  //REPOSITORIES
  getIt.registerSingleton<GetConversionRepositoryImpl>(GetConversionRepositoryImpl(
    getConversionDataSource: getIt<GetConversionDataSourceImpl>(),
  ));

  //USE CASE
  getIt.registerSingleton<GetConversionUseCaseImpl>(GetConversionUseCaseImpl(
    getConversionRepositoryImpl: getIt<GetConversionRepositoryImpl>(),
  ));
}
