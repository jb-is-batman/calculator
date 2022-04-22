import 'dart:math';

import 'package:calculator/app/customexceptions.dart';
import 'package:calculator/enums/operationtype_enum.dart';

class CalculationService {
  OperationType     _operationType = OperationType.none;
  double?           _operator1;
  double?           _operator2;

  OperationType get operationType => _operationType;
  double?       get operator1       => _operator1;
  double?       get number2       => _operator2;

  double? getResult() {
    if(_operationType == OperationType.none) throw OperatorNotSelectedException();
    if(_operator1 == null) throw InsufficientOperatorsException();

    switch (operationType) {
      case OperationType.plus:
        if(_operator2 == null)  throw InsufficientOperatorsException();
        return _operator1! + _operator2!;

      case OperationType.minus:
        if(_operator2 == null)  throw InsufficientOperatorsException();
        return _operator1! - _operator2!;

      case OperationType.multiply:
        if(_operator2 == null)  throw InsufficientOperatorsException();
        return _operator1!*_operator2!;

      case OperationType.divide:
        if(_operator2 == null)  throw InsufficientOperatorsException();
        if(_operator2 == 0)     throw DivisionByZeroException();
        return _operator1!/_operator2!;

      case OperationType.sqrt:
        if(_operator1! <= 0)    throw SquareRouteOperandNegativeException();
        return sqrt(_operator1!);
      
      case OperationType.none:
        throw OperatorNotSelectedException();
        
      default:
        throw OperatorNotImplemenedException();
    }
  }

  void setOperationType(OperationType value) {
    _operationType = value;
  }

  void setOperator1(double? value) {
    _operator1 = value;
  }

  void setOperator2(double? value) {
    _operator2 = value;
  }

  void clear() {
    _operationType  = OperationType.none;
    _operator1        = null;
    _operator2        = null;
  }
}