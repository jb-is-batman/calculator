class InsufficientOperatorsException implements Exception {
  @override
  String toString() {
    return "Required operand(s) are missing.";
  }
}

class SquareRouteOperandNegativeException implements Exception {
  @override
  String toString() {
    return "Can't calculate the square route of a negative operand.";
  }
}

class DivisionByZeroException implements Exception {
  @override
  String toString() {
    return "Can't divide operands by 0.";
  }
}

class NotANumberException implements Exception {
  @override
  String toString() {
    return "Value entered is not a valid number.";
  }
}

class OperatorNotImplemenedException implements Exception {
  @override
  String toString() {
    return "The operation you are trying to use is not implemented yet.";
  }
}

class OperatorNotSelectedException implements Exception {
  @override
  String toString() {
    return "No operation has been selected yet.";
  }
}