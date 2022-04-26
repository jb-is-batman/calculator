import 'package:calculator/app/defaultui.dart';
import 'package:calculator/enums/calculatoraction_enum.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'calculatoractionbutton_viewmodel.dart';

class CalculatorActionButtonView extends StatelessWidget {
  CalculatorActionButtonView({Key? key, required this.calculatorAction, required this.enabled}) : super(key: key);

  CalculatorAction  calculatorAction;
  bool              enabled;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorActionButtonViewModel>.reactive(
      builder: (BuildContext context, CalculatorActionButtonViewModel model, Widget? child) {
        return InkWell(
          onTap: enabled ? () => model.executeAction(calculatorAction) : null,
          child:Container(
            child: Text(calculatorAction.name),
              decoration: BoxDecoration(
              color:        enabled == true ? kaDefaultButtonColor : Colors.grey,
              borderRadius: kaDefaultBorderRadius
            ),
            margin:   const EdgeInsets.all(kaDefaultMargin),
            padding:  const EdgeInsets.all(kaDefaulPadding)
          )
        );
      },
      viewModelBuilder: () => CalculatorActionButtonViewModel(),
    );
  }
}