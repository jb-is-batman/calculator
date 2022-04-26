import 'package:calculator/enums/operationtype_enum.dart';
import 'package:calculator/ui/widgets/buttons/calculatorkeybutton/calculatorkeybutton_view.dart';
import 'package:calculator/ui/widgets/buttons/operationbutton/operationbutton_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'homescreen_viewmodel.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      builder: (BuildContext context, HomeScreenViewModel model, Widget? child) {
        return Scaffold(
          body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              
              return OperationButton(operationType: OperationType.values[index],);
            },
            itemCount: OperationType.values.length,
          ),
        );
      },
      viewModelBuilder: () => HomeScreenViewModel(),
    );
  }
}
