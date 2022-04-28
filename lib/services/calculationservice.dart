import 'dart:math';

import 'package:calculator/abstracts/calculation_abs.dart';
import 'package:calculator/app/customexceptions.dart';
import 'package:calculator/enums/operationtype_enum.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class CalculationService extends Calculation with ReactiveServiceMixin{

    CalculationService() {
    listenToReactiveValues([
      _operands, 
      _isNextEnabled, 
      _isResultsEnabled
    ]);
  }
  final Logger                      _logger             = Logger();              
  OperationType                     _operationType      = OperationType.none;
  final ReactiveValue<List<String>> _operands           = ReactiveValue<List<String>>([""]);
  final ReactiveValue<bool>         _isNextEnabled      = ReactiveValue<bool>(false);
  final ReactiveValue<bool>         _isResultsEnabled   = ReactiveValue<bool>(false);

  OperationType get operationType       => _operationType;
  int           get operandsLength      => _operands.value.length;
  String        get operand             => _operands.value.last;
  String        get title               =>  "Select Operand ${_operands.value.length}";
  bool          get isNextEnabled       => _isNextEnabled.value;
  bool          get isResultsEnabled    => _isResultsEnabled.value;

  @override
  double getResult() {
    if(_operationType == OperationType.none) throw OperatorNotSelectedException();

    if(_operationType == OperationType.sqrt) {
      double value = double.tryParse(_operands.value.first)!;
      return sqrt(value);
    }  
    
    List<double> parsedDoubles = _operands.value.map(double.parse).toList();
    
    switch (operationType) {
      case OperationType.plus:
        return plus(parsedDoubles);

      case OperationType.minus:
        return minus(parsedDoubles);
    
      case OperationType.multiply:
        return multiply(parsedDoubles);

      case OperationType.divide:
        return divide(parsedDoubles);
      
      case OperationType.none:
        throw OperatorNotSelectedException();
        
      default:
        throw OperatorNotImplemenedException();
    }
  }

  void setOperationType(OperationType value) {
    _operationType = value;
  }

  void addToOperand(String value) {
    String initOperandValue =_operands.value.last;

    if(value == "-" && initOperandValue == "") {
      _operands.value.last = "-";
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

    _operands.value.last = unParsed;
    _setIsNextEnabled();
    _setIsResultEnabled();
    notifyListeners();
  }

  void backspaceOperand() {
    String initOperandValue = _operands.value.last;
    if(initOperandValue == "") {
      _isNextEnabled.value = false;
    _setIsResultEnabled();
      return;
    }
    initOperandValue = initOperandValue.substring(0, initOperandValue.length - 1);
    _operands.value.last = initOperandValue;
    _setIsNextEnabled();
    _setIsResultEnabled();
  }

  void _setIsNextEnabled() {
    if(_operands.value.length >= maxOperands) {
      _isNextEnabled.value = false;
      return;
    }
    else if(double.tryParse(_operands.value.last) != null) {
        _isNextEnabled.value = true;
        return;
      }
    _isNextEnabled.value = false;
  }
  void _setIsResultEnabled() {
    _logger.d("length: ${_operands.value.length}");
    if(_operands.value.length > 1) {
      if(double.tryParse(_operands.value.last) != null) {
        _isResultsEnabled.value = true;
      } else {
        _isResultsEnabled.value = false;
      }
    } else {
      _isResultsEnabled.value = false;
    }
    notifyListeners();
  }

  void clearOperand() {
    _isNextEnabled.value  = false;
    _operands.value.last  = "";
    _setIsResultEnabled();
  }

  void clear() {
    _operationType          = OperationType.none;
    _isNextEnabled.value    = false;
    _isResultsEnabled.value = false;
    _operands.value.clear();
    _operands.value.add("");
    notifyListeners();
  }
 @override 
  void next() {
    _operands.value.add("");
    _isNextEnabled.value  = false;
    _setIsResultEnabled();
    notifyListeners();
  }

  @override
  void back() {
    _operands.value.removeLast();
    _logger.d("${_operands.value.length - 1}:${_operands.value.last}");
    _setIsResultEnabled();
    notifyListeners();
  }

  @override
  double divide(List<double> value) {
    return value.reduce((value, element) => value / element);
  }

  @override
  double minus(List<double> value) {
    return value.reduce((value, element) => value - element);
  }

  @override
  double multiply(List<double> value) {
    return value.reduce((value, element) => value * element);
  }

  @override
  double plus(List<double> value) {
    return value.reduce((value, element) => value + element);
  }

  @override
  double sqrt(double value) {
    return sqrt(value);
  }
}