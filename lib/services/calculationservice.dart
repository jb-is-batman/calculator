import 'dart:math';

import 'package:calculator/app/customexceptions.dart';
import 'package:calculator/enums/operationtype_enum.dart';
import 'package:stacked/stacked.dart';

class CalculationService with ReactiveServiceMixin{

    CalculationService() {
      
    listenToReactiveValues([_operand1, _operand2, _screenIndex]);
  }

  OperationType               _operationType    = OperationType.none;
  final ReactiveValue<String> _operand1         = ReactiveValue<String>("");
  final ReactiveValue<String> _operand2         = ReactiveValue<String>("");
  final ReactiveValue<int>    _screenIndex      = ReactiveValue<int>(0);

  OperationType get operationType     => _operationType;
  String        get operand1          => _operand1.value;
  String        get operand2          => _operand2.value;
  int           get screenIndex       => _screenIndex.value;

  double getResult() {
    if(_operationType == OperationType.none) throw OperatorNotSelectedException();

    double? oprt1 = double.tryParse(_operand1.value);
    double? oprt2 = double.tryParse(_operand2.value);

    if(oprt1 == null) throw NotANumberException();

    switch (operationType) {
      case OperationType.plus:
      if(oprt2 == null)   throw NotANumberException();
        return oprt1 + oprt2;

      case OperationType.minus:
        if(oprt2 == null) throw NotANumberException();
        return oprt1 - oprt2;

      case OperationType.multiply:
        if(oprt2 == null) throw NotANumberException();
        return oprt1*oprt2;

      case OperationType.divide:
        if(oprt2 == null) throw NotANumberException();
        if(oprt2 == 0)    throw DivisionByZeroException();
        return oprt1/oprt2;

      case OperationType.sqrt:
        if(oprt1 <= 0)    throw SquareRouteOperandNegativeException();
        return sqrt(oprt1);
      
      case OperationType.none:
        throw OperatorNotSelectedException();
        
      default:
        throw OperatorNotImplemenedException();
    }
  }

  void setScreenIndex(int index) {
    _screenIndex.value = index;
  }

  void setOperationType(OperationType value) {
    _operationType = value;
  }

  void addToOperand(String value) {
    String initOperandValue = _screenIndex.value == 1 ? _operand1.value : _operand2.value;

    if(value == "-" && initOperandValue == "") {
      _screenIndex.value == 1 ? _operand1.value = "-" : _operand2.value = "-";
      return;
    }
    String  unParsed  = "$initOperandValue$value";
    double? parsed    = double.tryParse(unParsed);
    if(parsed == null) return;
    _screenIndex.value == 1 ? _operand1.value = unParsed : _operand2.value = unParsed;
  }

  void backspaceOperand() {
    String initOperandValue = _screenIndex.value == 1 ? _operand1.value : _operand2.value;
    if(initOperandValue == "") {
      return;
    }
    initOperandValue = initOperandValue.substring(0, initOperandValue.length - 1);
    _screenIndex.value == 1 ? _operand1.value = initOperandValue : _operand2.value = initOperandValue;
  }

  void clearOperand() {
    if(_screenIndex.value == 1) {
      _operand1.value = "";
      return;
    }
    _operand2.value = "";
  }

  void clear() {
    _operationType      = OperationType.none;
    _operand1.value     = "";
    _operand2.value     = "";
    _screenIndex.value  = 0;
  }
}