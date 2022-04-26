import 'package:calculator/app/locator.dart';
import 'package:calculator/enums/calculatoraction_enum.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:stacked/stacked.dart';

class CalculatorActionButtonViewModel extends BaseViewModel {
  
  final CalculationService    _calculationService     = getIt.get<CalculationService>();

  void executeAction(CalculatorAction value) {
    switch (value) {
      case CalculatorAction.backspace:
        
        _calculationService.backspaceOperand1();
        break;
      default:
    }
  }
}