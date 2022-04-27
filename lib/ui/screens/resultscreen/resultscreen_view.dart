import 'package:calculator/app/locator.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:calculator/ui/screens/homescreen/homescreen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import 'resultscreen_viewmodel.dart';

class ResultScreenView extends StatelessWidget {
  ResultScreenView({Key? key}) : super(key: key);

  final CalculationService _calculationService = getIt.get<CalculationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultScreenViewModel>.reactive(
      builder: (BuildContext context, ResultScreenViewModel model, Widget? child) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(135, 210, 132, 1),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(),
                Text("${model.data}", style: TextStyle(color: Colors.white, fontSize: 40)),
                Divider(),
                TextButton(
                  onPressed: (){
                    _calculationService.clear();
                    Get.offAll(const HomeScreenView());
                  }, 
                  child: const Text("Reset", style: TextStyle(color: Color.fromRGBO(39, 38, 38, 1),fontSize: 25))
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => ResultScreenViewModel(),
    );
  }
}