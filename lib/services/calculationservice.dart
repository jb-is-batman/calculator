import 'dart:math';

import 'package:calculator/app/customexceptions.dart';
import 'package:calculator/enums/operationtype_enum.dart';
import 'package:stacked/stacked.dart';

class CalculationService with ReactiveServiceMixin{

    CalculationService() {
      
    listenToReactiveValues([_operand1, _operand2]);
  }

  OperationType               _operationType    = OperationType.none;
  // If true it means that we are currently changing operand 1's value.  If it 
  // is false, then the assumption is that we are changing operand 2's value
  bool                        _isOperand1Active = true; 
  final ReactiveValue<String> _operand1         = ReactiveValue<String>("");
  final ReactiveValue<String> _operand2         = ReactiveValue<String>("");

  OperationType get operationType     => _operationType;
  String        get operand1          => _operand1.value;
  String        get operand2          => _operand2.value;
  bool          get isOperand1Active  => _isOperand1Active;

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
        return oprt2 - oprt2;

      case OperationType.multiply:
        if(oprt2 == null) throw NotANumberException();
        return oprt1*oprt2;

      case OperationType.divide:
        if(oprt2 == null) throw NotANumberException();
        if(oprt2 == 0)    throw DivisionByZeroException();
        return oprt2/oprt2;

      case OperationType.sqrt:
        if(oprt1 <= 0)    throw SquareRouteOperandNegativeException();
        return sqrt(oprt1);
      
      case OperationType.none:
        throw OperatorNotSelectedException();
        
      default:
        throw OperatorNotImplemenedException();
    }
  }

  void setOperand1Active() {
    _isOperand1Active = true;
  }

  void setOperand2Active() {
    _isOperand1Active = false;
  }

  void setOperationType(OperationType value) {
    _operationType = value;
  }

  void addToOperand1(String value) {
    if(value == "-" && _operand1.value == "") {
       _operand1.value = "-";
       return;
    }
    String  unParsed  = "${_operand1.value}$value";
    double? parsed    = double.tryParse(unParsed);
    if(parsed == null) return;
    _operand1.value = unParsed;
  }

  void addToOperand2(String value) {
    if(value == "-" && _operand2.value.length == 1) {
      _operand2.value = "-";
      return;
    }
    String unParsed = "${_operand2.value}$value";
    double? parsed = double.tryParse(unParsed);
    if(parsed == null) return;
    _operand2.value = unParsed;
  }

  void backspaceOperand1() {
    if(_operand1.value == "") {
      return;
    }
    _operand1.value = _operand1.value.substring(0, _operand1.value.length - 1);
  }

  void clear() {
    _operationType    = OperationType.none;
    _operand1.value  = "";
    _operand2.value  = "";
  }
}