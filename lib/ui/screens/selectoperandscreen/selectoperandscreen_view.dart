import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'selectoperandscreen_viewmodel.dart';

class SelectOperandScreenView extends StatelessWidget {
  const SelectOperandScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectOperandScreenViewModel>.reactive(
      builder: (BuildContext context, SelectOperandScreenViewModel model, Widget? child) {
        return Scaffold();
      },
      viewModelBuilder: () => SelectOperandScreenViewModel(),
    );
  }
}