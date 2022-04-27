enum OperationType {
  plus, minus, multiply, divide, sqrt, none
}

extension ExtraFunctionality on OperationType
{
  String get customName
  {
    switch (this)
    {
      case OperationType.minus:
        return "Minus";
      case OperationType.plus:
        return "Plus";
      case OperationType.multiply:
        return "Multiply";
      case OperationType.divide:
        return "Divide";
      case OperationType.sqrt:
        return "Square Root";
      case OperationType.none:
        return "None";
    }
  }

  String get symbol
  {
    switch (this)
    {
      case OperationType.minus:
        return "-";
      case OperationType.plus:
        return "+";
      case OperationType.multiply:
        return "x";
      case OperationType.divide:
        return "÷";
      case OperationType.sqrt:
        return "√";
      case OperationType.none:
        return "N/A";
    }
  }
}