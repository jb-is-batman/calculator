import 'package:calculator/app/locator.dart';
import 'package:calculator/enums/nondigitoperation_enum.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:calculator/ui/widgets/buttons/calculatorkeybutton/calculatorkeybutton_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'selectoperandscreen_viewmodel.dart';

class SelectOperandScreenView extends StatefulWidget {
  SelectOperandScreenView({Key? key}) : super(key: key);

  @override
  State<SelectOperandScreenView> createState() => _SelectOperandScreenViewState();
}

class _SelectOperandScreenViewState extends State<SelectOperandScreenView> {
  final CalculationService    _calculationService     = getIt.get<CalculationService>();

  final TextEditingController _textEditingController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectOperandScreenViewModel>.reactive(
      builder: (BuildContext context, SelectOperandScreenViewModel model, Widget? child) {
        return Scaffold(
          body: Column(
            children: [
              TextField(
                controller: _textEditingController,
                onChanged: (String value) {
                  _textEditingController.text = value;
                },
                readOnly: true,
                
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: CalculatorKeyButtonView(digit: 1)),
                  Expanded(child: CalculatorKeyButtonView(digit: 2)),
                  Expanded(child: CalculatorKeyButtonView(digit: 3)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: CalculatorKeyButtonView(digit: 4)),
                  Expanded(child: CalculatorKeyButtonView(digit: 5)),
                  Expanded(child: CalculatorKeyButtonView(digit: 6)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: CalculatorKeyButtonView(digit: 7)),
                  Expanded(child: CalculatorKeyButtonView(digit: 8)),
                  Expanded(child: CalculatorKeyButtonView(digit: 9)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: CalculatorKeyButtonView(nonDigitOperation: NonDigitOperation.decimal,)),
                  Expanded(child: CalculatorKeyButtonView(digit: 0)),
                  Expanded(child: CalculatorKeyButtonView(nonDigitOperation: NonDigitOperation.negative)),
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