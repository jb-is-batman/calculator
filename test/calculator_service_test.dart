import 'package:calculator/enums/operationtype_enum.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCalculatorService extends Mock implements CalculationService {}

void main() {
  CalculationService systemUnderTest = CalculationService();

  test("Initial values are correct", (){
    expect(systemUnderTest.screenIndex, 0);
    expect(systemUnderTest.operationType, OperationType.none);
    expect(systemUnderTest.operand, "");
    expect(systemUnderTest.title, "Select Operand 2");
    expect(systemUnderTest.isNextEnabled, false);
  });

  group("Page index testing", () {
    test("Article index change", (){
      systemUnderTest.setScreenIndex(1);
      expect(systemUnderTest.screenIndex, 1);
      systemUnderTest.setScreenIndex(5);
      expect(systemUnderTest.screenIndex, 1);
    });
  });
}