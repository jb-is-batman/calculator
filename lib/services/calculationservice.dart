import 'dart:math';

import 'package:calculator/app/customexceptions.dart';
import 'package:calculator/enums/operationtype_enum.dart';
import 'package:stacked/stacked.dart';

class CalculationService with ReactiveServiceMixin{

    CalculationService() {
      
    listenToReactiveValues([
      _operand1, 
      _operand2, 
      _screenIndex,
      _isNextEnabled, 
    ]);
  }

  OperationType               _operationType      = OperationType.none;
  final ReactiveValue<String> _operand1           = ReactiveValue<String>("");
  final ReactiveValue<String> _operand2           = ReactiveValue<String>("");
  final ReactiveValue<int>    _screenIndex        = ReactiveValue<int>(0);
  final ReactiveValue<bool>   _isNextEnabled      = ReactiveValue<bool>(false);


  OperationType get operationType       => _operationType;
  int           get screenIndex         => _screenIndex.value;
  String        get operand             => _screenIndex.value == 1 ? _operand1.value : _operand2.value;
  String        get title               => _screenIndex.value == 1 ? "Select Operand 1" : "Select Operand 2";
  bool          get isNextEnabled       => _isNextEnabled.value;

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
    if(index < 0 || index > 2) {
      return;
    }
    _screenIndex.value = index;
    _setIsNextEnabled();
  }

  void setOperationType(OperationType value) {
    _operationType = value;
  }

  void addToOperand(String value) {
    String initOperandValue = _screenIndex.value == 1 ? _operand1.value : _operand2.value;

    if(value == "-" && initOperandValue == "") {
      _screenIndex.value == 1 ? _operand1.value = "-" : _operand2.value = "-";
      _isNextEnabled.value = false;
      return;
    }
    else if(value == "-" && initOperandValue.isNotEmpty) {
      return;
    }

    String  unParsed  = "$initOperandValue$value";
    double? parsed    = double.tryParse(unParsed);
    if(parsed == null) {
      _isNextEnabled.value = false;
      return;
    }

    _screenIndex.value == 1 ? _isNextEnabled.value  = true      : _isNextEnabled.value = true;
    _screenIndex.value == 1 ? _operand1.value       = unParsed  : _operand2.value = unParsed;
    _setIsNextEnabled();
  }

  void backspaceOperand() {
    String initOperandValue = _screenIndex.value == 1 ? _operand1.value : _operand2.value;
    if(initOperandValue == "") {
      _isNextEnabled.value = false;
      return;
    }
    initOperandValue = initOperandValue.substring(0, initOperandValue.length - 1);
    _screenIndex.value == 1 ? _operand1.value = initOperandValue : _operand2.value = initOperandValue;
    _setIsNextEnabled();
  }

  void _setIsNextEnabled() {
    if(_screenIndex.value == 1) {
      if(double.tryParse(_operand1.value) != null) {
        _isNextEnabled.value = true;
        return;
      }
    } else if(_screenIndex.value == 2) {
      if(double.tryParse(_operand2.value) != null) {
        _isNextEnabled.value = true;
        return;
      }
    } 
    _isNextEnabled.value = false;
  }

  void clearOperand() {
    _isNextEnabled.value  = false;
    if(_screenIndex.value == 1) {
      _operand1.value = "";
      return;
    }
    _operand2.value       = "";
  }

  void clear() {
    _operationType        = OperationType.none;
    _operand1.value       = "";
    _operand2.value       = "";
    _screenIndex.value    = 0;
    _isNextEnabled.value  = false;
  }
}