import 'package:calculator/services/actionsbuttonsservice.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<CalculationService>(()    => CalculationService());
  getIt.registerLazySingleton<ActionButtonsService>(()  => ActionButtonsService());
}