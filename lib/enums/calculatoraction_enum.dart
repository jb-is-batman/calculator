
enum CalculatorAction {
  backspace, next, result, clear, back, reset
}

extension ExtraFunctionality on CalculatorAction
{

  String get name
  {
    switch (this)
    {
      case CalculatorAction.backspace:
        return "Backspace";
      case CalculatorAction.next:
        return "Next";
      case CalculatorAction.result:
        return "Result";
      case CalculatorAction.clear:
        return "Clear";
      case CalculatorAction.back:
        return "Back";
      case CalculatorAction.reset:
        return "Reset";
    }
  }
}