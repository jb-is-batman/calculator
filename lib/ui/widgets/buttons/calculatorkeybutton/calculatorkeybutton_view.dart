import 'package:calculator/enums/nondigitoperation_enum.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'calculatorkeybutton_viewmodel.dart';

class CalculatorKeyButtonView extends StatelessWidget {
  CalculatorKeyButtonView({Key? key, this.digit, this.nonDigitOperation}) : super(key: key);

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
          onTap: model.onButtonTapped,
          child: Container(
            alignment: Alignment.center,
            child: Text("${digit ?? nonDigitOperation!.symbol}", style: TextStyle(fontSize: 25),),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.all(Radius.circular(model.boderRadius),)
            ),
            margin: EdgeInsets.only(
              left:   model.margin, 
              right:  model.margin, 
              top:    model.margin, 
              bottom: model.margin
            ),
            padding: EdgeInsets.only(
              left:   model.padding,
              right:  model.padding,
              top:    model.padding,
              bottom: model.padding
            ),
          )
        );
      },
      viewModelBuilder: () => CalculatorKeyButtonViewModel(),
    );
  }
}