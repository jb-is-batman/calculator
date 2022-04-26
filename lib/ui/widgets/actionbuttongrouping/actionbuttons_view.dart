import 'package:calculator/enums/calculatoraction_enum.dart';
import 'package:calculator/ui/widgets/buttons/calculatoractionbutton/calculatoractionbutton_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'actionbuttons_viewmodel.dart';

class ActionButtonsView extends StatelessWidget {
  const ActionButtonsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActionButtonsViewModel>.reactive(
      builder: (BuildContext context, ActionButtonsViewModel model, Widget? child) {
        return Column(
          children: [
            CalculatorActionButtonView(calculatorAction: CalculatorAction.backspace, enabled: true),
            CalculatorActionButtonView(calculatorAction: CalculatorAction.clear, enabled: true),
            CalculatorActionButtonView(calculatorAction: CalculatorAction.next, enabled: true),
            CalculatorActionButtonView(calculatorAction: CalculatorAction.back, enabled: true),
            CalculatorActionButtonView(calculatorAction: CalculatorAction.result, enabled: false),
          ],
        );
      },
      viewModelBuilder: () => ActionButtonsViewModel(),
    );
  }
}