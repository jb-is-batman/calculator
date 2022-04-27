import 'package:calculator/app/defaultui.dart';
import 'package:calculator/app/locator.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class ResultScreenViewModel extends FutureViewModel<double> {

  final CalculationService    _calculationService     = getIt.get<CalculationService>();

  Future<double> calculateResults() async {
    return _calculationService.getResult();
  }

  @override
  Future<double> futureToRun() => calculateResults();

  @override
  void onError(error) {
    Get.defaultDialog(
      title: "Error calculating result", 
      middleText: error.toString(), 
      backgroundColor: kaDefaultErrorColor,
    );
  }
}