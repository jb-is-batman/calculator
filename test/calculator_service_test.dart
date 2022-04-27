import 'package:calculator/app/locator.dart';
import 'package:calculator/enums/operationtype_enum.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCalculatorService             extends Mock implements CalculationService {}

void main() {
  setupLocator();
  CalculationService sutCalculationService = CalculationService();

  test("Initial values are correct", (){
    expect(sutCalculationService.screenIndex, 0);
    expect(sutCalculationService.operationType, OperationType.none);
    expect(sutCalculationService.operand, "");
    expect(sutCalculationService.title, "Select Operand 2");
    expect(sutCalculationService.isNextEnabled, false);
  });

  group("Page index testing", () {
    test("Article index change", (){
      sutCalculationService.setScreenIndex(1);
      expect(sutCalculationService.screenIndex, 1);
      sutCalculationService.setScreenIndex(5);
      expect(sutCalculationService.screenIndex, 1);
    });
  });
}