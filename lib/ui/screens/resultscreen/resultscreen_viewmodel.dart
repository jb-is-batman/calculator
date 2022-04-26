import 'package:calculator/app/locator.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:stacked/stacked.dart';

class ResultScreenViewModel extends BaseViewModel {

  final CalculationService    _calculationService     = getIt.get<CalculationService>();
  
  double get result => _calculationService.getResult();

}