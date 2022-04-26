import 'package:calculator/app/defaultui.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'calculatoractionbutton_viewmodel.dart';

class CalculatorActionButtonView extends StatelessWidget {
  const CalculatorActionButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorActionButtonViewModel>.reactive(
      builder: (BuildContext context, CalculatorActionButtonViewModel model, Widget? child) {
        return InkWell(
          onTap: (){},
          child:Container(
            child: Text("TEST"),
              decoration: const BoxDecoration(
              color: kaDefaultButtonColor,
              borderRadius: kaDefaultBorderRadius
            ),
            margin: const EdgeInsets.all(kaDefaultMargin),
            padding: const EdgeInsets.all(kaDefaulPadding)
          )
        );
      },
      viewModelBuilder: () => CalculatorActionButtonViewModel(),
    );
  }
}