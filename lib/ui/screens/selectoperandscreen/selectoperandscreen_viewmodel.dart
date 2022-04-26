import 'package:calculator/app/locator.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:stacked/stacked.dart';

class SelectOperandScreenViewModel extends ReactiveViewModel {
  
  final CalculationService    _calculationService     = getIt.get<CalculationService>();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_calculationService];

  String get textfieldValue => _calculationService.operand;
  String get operationName  => _calculationService.operationType.name;
  String get title          => _calculationService.title;

}