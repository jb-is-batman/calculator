import 'package:calculator/enums/operationtype_enum.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'calculatorkeybutton_viewmodel.dart';

class CalculatorKeyButtonView extends StatelessWidget {
  CalculatorKeyButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorKeyButtonViewModel>.reactive(
      builder: (BuildContext context, CalculatorKeyButtonViewModel model, Widget? child) {
        return IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.place)
          );
      },
      viewModelBuilder: () => CalculatorKeyButtonViewModel(),
    );
  }
}