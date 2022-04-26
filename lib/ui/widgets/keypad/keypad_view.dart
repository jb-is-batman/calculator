import 'package:calculator/enums/nondigitoperation_enum.dart';
import 'package:calculator/ui/widgets/buttons/calculatorkeybutton/calculatorkeybutton_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'keypad_viewmodel.dart';

class KeypadView extends StatelessWidget {
  const KeypadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<KeypadViewModel>.reactive(
      builder: (BuildContext context, KeypadViewModel model, Widget? child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(child: CalculatorKeyButtonView(digit: 1)),
                Expanded(child: CalculatorKeyButtonView(digit: 2)),
                Expanded(child: CalculatorKeyButtonView(digit: 3)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(child: CalculatorKeyButtonView(digit: 4)),
                Expanded(child: CalculatorKeyButtonView(digit: 5)),
                Expanded(child: CalculatorKeyButtonView(digit: 6)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(child: CalculatorKeyButtonView(digit: 7)),
                Expanded(child: CalculatorKeyButtonView(digit: 8)),
                Expanded(child: CalculatorKeyButtonView(digit: 9)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(child: CalculatorKeyButtonView(nonDigitOperation: NonDigitOperation.decimal,)),
                Expanded(child: CalculatorKeyButtonView(digit: 0)),
                Expanded(child: CalculatorKeyButtonView(nonDigitOperation: NonDigitOperation.negative)),
              ],
            ),
          ],
        );
      },
      viewModelBuilder: () => KeypadViewModel(),
    );
  }
}