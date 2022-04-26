import 'package:calculator/app/defaultui.dart';
import 'package:calculator/enums/nondigitoperation_enum.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'calculatorkeybutton_viewmodel.dart';

class CalculatorKeyButtonView extends StatelessWidget {
  const CalculatorKeyButtonView({Key? key, this.digit, this.nonDigitOperation}) : super(key: key);

  final int?                digit;
  final NonDigitOperation?  nonDigitOperation;


  @override
  Widget build(BuildContext context) {
    if(digit == null && nonDigitOperation == null) {
      throw Exception("Digit & Non-Digit operation can't both be null");
    } else if (digit != null && nonDigitOperation != null) {
      throw Exception("Digit & Non-Digit operation can't both be not null.  Select only one");
    }
    return ViewModelBuilder<CalculatorKeyButtonViewModel>.reactive(
      builder: (BuildContext context, CalculatorKeyButtonViewModel model, Widget? child) {
        return InkWell(
          onTap: () => model.onAddOperandToNumber(digit == null ? nonDigitOperation!.symbol : "$digit"),
          child: Container(
            alignment: Alignment.center,
            child: Text("${digit ?? nonDigitOperation!.symbol}", style: TextStyle(fontSize: 25),),
            decoration: const BoxDecoration(
              color: kaDefaultButtonColor,
              borderRadius: kaDefaultBorderRadius
            ),
            margin: EdgeInsets.all(kaDefaultMargin),
            padding: EdgeInsets.all(kaDefaulPadding)
          )
        );
      },
      viewModelBuilder: () => CalculatorKeyButtonViewModel(),
    );
  }
}