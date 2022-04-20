import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'homescreen_viewmodel.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      builder: (BuildContext context, HomeScreenViewModel model, Widget? child) {
        return Scaffold();
      },
      viewModelBuilder: () => HomeScreenViewModel(),
    );
  }
}