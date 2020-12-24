import 'package:get_it/get_it.dart';
import 'package:wave/business_logic/services/api/Api.dart';
import 'package:wave/business_logic/services/api/QuotesFakeApi.dart';
import 'package:wave/business_logic/services/api/QuotesApi.dart';
import 'package:wave/business_logic/view_models/quote_viewmodel.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<Api>(() => QuotesApi());
  serviceLocator.registerFactory(() => QuoteViewModel());
  // getIt.registerFactory(() => QuotesFakeApi());
}