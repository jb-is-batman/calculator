import 'package:calculator/app/locator.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class CalculatorKeyButtonViewModel extends BaseViewModel {
  
  final CalculationService  _calculationService  = getIt.get<CalculationService>();

  double _buttonWidth = Get.width/3;

  double  get buttonWidth => _buttonWidth;
  double  get boderRadius => 8;

  void onAddOperandToNumber(String value) {
    _calculationService.addToOperand(value);
  }
}