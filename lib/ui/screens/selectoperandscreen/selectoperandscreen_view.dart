import 'package:calculator/app/locator.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:calculator/ui/widgets/buttons/calculatorkeybutton/calculatorkeybutton_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'selectoperandscreen_viewmodel.dart';

class SelectOperandScreenView extends StatelessWidget {
  SelectOperandScreenView({Key? key}) : super(key: key);

  final CalculationService  _calculationService = getIt.get<CalculationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectOperandScreenViewModel>.reactive(
      builder: (BuildContext context, SelectOperandScreenViewModel model, Widget? child) {
        return Scaffold(
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorKeyButtonView(digit: 1),
                  CalculatorKeyButtonView(digit: 2),
                  CalculatorKeyButtonView(digit: 3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorKeyButtonView(digit: 4),
                  CalculatorKeyButtonView(digit: 5),
                  CalculatorKeyButtonView(digit: 6),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorKeyButtonView(digit: 7),
                  CalculatorKeyButtonView(digit: 8),
                  CalculatorKeyButtonView(digit: 9),
                ],
              )
            ],
          ),
        );
      },
      viewModelBuilder: () => SelectOperandScreenViewModel(),
    );
  }
}