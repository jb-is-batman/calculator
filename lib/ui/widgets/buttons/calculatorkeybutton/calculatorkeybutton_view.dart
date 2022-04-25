import 'package:calculator/enums/operationtype_enum.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'calculatorkeybutton_viewmodel.dart';

class CalculatorKeyButtonView extends StatelessWidget {
  CalculatorKeyButtonView({Key? key, required this.digit}) : super(key: key);

  int digit;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorKeyButtonViewModel>.reactive(
      builder: (BuildContext context, CalculatorKeyButtonViewModel model, Widget? child) {
        return InkWell(
          onTap: (){},
          child: Container(
            child: Text("$digit", style: TextStyle(fontSize: 25),),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.all(Radius.circular(8),)
            ),
          )
        );
      },
      viewModelBuilder: () => CalculatorKeyButtonViewModel(),
    );
  }
}