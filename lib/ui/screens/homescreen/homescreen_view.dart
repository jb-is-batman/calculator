import 'package:calculator/ui/widgets/buttons/operationbutton_view.dart';
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OperationButton(onPressed: model.plusTapped, title: "Plus"),
              OperationButton(onPressed: model.minusTapped, title: "Minus"),
              OperationButton(onPressed: model.multiplyTapped, title: "Multiply"),
              OperationButton(onPressed: model.divideTapped, title: "Divide"),
              OperationButton(onPressed: model.sqrtTapped, title: "Square Route"),
            ],
          ),
        );
      },
      viewModelBuilder: () => HomeScreenViewModel(),
    );
  }
}
