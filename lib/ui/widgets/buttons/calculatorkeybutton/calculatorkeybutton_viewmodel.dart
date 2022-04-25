import 'package:calculator/app/locator.dart';
import 'package:calculator/enums/operationtype_enum.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class CalculatorKeyButtonViewModel extends BaseViewModel {

  double _buttonWidth = Get.width/3;

  double  get margin      => 4;       
  double  get padding     => 16;       
  double  get buttonWidth => _buttonWidth;
  double  get boderRadius => 8;

  void onButtonTapped() {

  }
}