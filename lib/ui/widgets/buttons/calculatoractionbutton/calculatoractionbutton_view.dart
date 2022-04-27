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
        return ListTile(
          
          onTap: enabled ? () => model.executeAction(calculatorAction) : null,
          title: Container(
            child: Text(calculatorAction.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              decoration: BoxDecoration(
              color:        enabled == true ? kaDefaultActionButtonColor : Colors.grey,
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