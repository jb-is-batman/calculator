import 'package:calculator/ui/widgets/actionbuttongrouping/actionbuttons_view.dart';
import 'package:calculator/ui/widgets/keypad/keypad_view.dart';
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

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectOperandScreenViewModel>.reactive(
      builder: (BuildContext context, SelectOperandScreenViewModel model, Widget? child) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(40, 52, 64, 1),
          body: Column(
            children: [
              Container(height: Get.height*0.05,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text("Operation: " + model.operationName, style: TextStyle(color: Colors.white,), textAlign: TextAlign.center,)),
                  Expanded(child: Text(model.title, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
                ],
              ),
              Divider(color: Colors.white38),
              Text(model.textfieldValue, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
              Divider(color: Colors.white38,),
              const KeypadView(),
              Container(height: 16,),
              const ActionButtonsView()
            ],
          ),
        );
      },
      viewModelBuilder: () => SelectOperandScreenViewModel(),
    );
  }
}