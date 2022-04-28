import 'package:calculator/app/locator.dart';
import 'package:calculator/enums/calculatoraction_enum.dart';
import 'package:calculator/enums/operationtype_enum.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:calculator/ui/screens/homescreen/homescreen_view.dart';
import 'package:calculator/ui/screens/resultscreen/resultscreen_view.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class CalculatorActionButtonViewModel extends BaseViewModel {
  
  final CalculationService  _calculationService = getIt.get<CalculationService>();
  final Logger              _logger             = Logger();

  void executeAction(CalculatorAction value) {
    switch (value) {
      case CalculatorAction.result:
        Get.to(ResultScreenView());
        break;
      case CalculatorAction.backspace:
        _calculationService.backspaceOperand();
        break;
      case CalculatorAction.clear:
        _calculationService.clearOperand();
        break;
      case CalculatorAction.next:
        next();
        break;
      case CalculatorAction.back:
        _logger.d("SCREEN INDEX: ${_calculationService.operandsLength}");
        if(_calculationService.operandsLength == 1) {
          _calculationService.clear();
          Get.offAll(const HomeScreenView());
          return;
        }
        _calculationService.back();

        break;
      default:
    }
  }

  void next() {
    if(_calculationService.operationType == OperationType.sqrt) {
      Get.to(ResultScreenView());
    } 
    _calculationService.next();
  }
}