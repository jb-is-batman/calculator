import 'package:calculator/app/locator.dart';
import 'package:calculator/enums/calculatoraction_enum.dart';
import 'package:calculator/enums/operationtype_enum.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:calculator/ui/screens/homescreen/homescreen_view.dart';
import 'package:calculator/ui/screens/resultscreen/resultscreen_view.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class CalculatorActionButtonViewModel extends BaseViewModel {
  
  final CalculationService    _calculationService     = getIt.get<CalculationService>();

  void executeAction(CalculatorAction value) {
    switch (value) {
      case CalculatorAction.backspace:
        _calculationService.backspaceOperand();
        break;
      case CalculatorAction.clear:
        _calculationService.clearOperand();
        break;
      case CalculatorAction.next:
        calculatorNextOrResult();
        break;
      case CalculatorAction.back:
        if(_calculationService.screenIndex == 1) {
          _calculationService.clear();
          Get.offAll(const HomeScreenView());
        }
        _calculationService.setScreenIndex(1);
        break;
      default:
    }
  }

  void calculatorNextOrResult() {
    if(_calculationService.operationType == OperationType.sqrt) {
      Get.to(ResultScreenView());
    } else if(_calculationService.screenIndex == 1) {
      _calculationService.setScreenIndex(2);
    } else {
      Get.to(ResultScreenView());
    }
  }
}