import 'package:calculator/app/locator.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:stacked/stacked.dart';

class ActionButtonsViewModel extends ReactiveViewModel {

  final CalculationService    _calculationService     = getIt.get<CalculationService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_calculationService];

  bool  get nextEnabled       => _calculationService.isNextEnabled;
}