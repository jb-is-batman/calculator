import 'dart:math';

import 'package:calculator/enums/operationtype_enum.dart';

class CalculationService {
  OperationType     _operationType = OperationType.none;
  double?           _number1;
  double?           _number2;

  OperationType get operationType => _operationType;
  double?       get number1       => _number1;
  double?       get number2       => _number2;

  double? getResult() {

    switch (operationType) {
      case OperationType.plus:
        return _number1! + _number2!;
      case OperationType.minus:
        return _number1! - _number2!;
      case OperationType.multiply:
        return _number1!*_number2!;
      case OperationType.divide:
        return _number1!/_number2!;
      case OperationType.sqrt:
        return sqrt(_number1!);
      default:
      return null;
    }
  }

  void setOperationType(OperationType value) {
    _operationType = value;
  }

  void setNumber1(double value) {
    _number1 = value;
  }

  void setNumber2(double value) {
    _number2 = value;
  }

  void clear() {
    _operationType  = OperationType.none;
    _number1        = null;
    _number2        = null;
  }
}