import 'package:calculator/app/locator.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:stacked/stacked.dart';

class SelectOperandScreenViewModel extends ReactiveViewModel {
  
  final CalculationService    _calculationService     = getIt.get<CalculationService>();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_calculationService];

  String get textfieldValue => _calculationService.screenIndex == 1 ? _calculationService.operand1 : _calculationService.operand2;
  String get operationName  => _calculationService.operationType.name;
  String get title          => _calculationService.screenIndex == 1 ? "Select Operand 1" : "Select Operand 2";

}