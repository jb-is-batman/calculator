import 'package:calculator/enums/nondigitoperation_enum.dart';
import 'package:calculator/ui/widgets/buttons/calculatoractionbutton/calculatoractionbutton_view.dart';
import 'package:calculator/ui/widgets/buttons/calculatorkeybutton/calculatorkeybutton_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'selectoperandscreen_viewmodel.dart';

class SelectOperandScreenView extends StatefulWidget {
  const SelectOperandScreenView({Key? key}) : super(key: key);

  @override
  State<SelectOperandScreenView> createState() => _SelectOperandScreenViewState();
}

class _SelectOperandScreenViewState extends State<SelectOperandScreenView> {

  final TextEditingController _textEditingController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectOperandScreenViewModel>.reactive(
      builder: (BuildContext context, SelectOperandScreenViewModel model, Widget? child) {
        return Scaffold(
          body: Column(
            children: [
              Container(height: Get.height*0.1,),
              Text(model.textfieldValue, style: const TextStyle(fontSize: 20),),

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
              Container(height: 16,),
              CalculatorActionButtonView(),
              CalculatorActionButtonView(),
              CalculatorActionButtonView(),
            ],
          ),
        );
      },
      viewModelBuilder: () => SelectOperandScreenViewModel(),
    );
  }
}