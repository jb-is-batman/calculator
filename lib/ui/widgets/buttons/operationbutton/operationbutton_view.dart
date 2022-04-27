import 'package:calculator/app/locator.dart';
import 'package:calculator/enums/operationtype_enum.dart';
import 'package:calculator/services/calculationservice.dart';
import 'package:calculator/ui/screens/selectoperandscreen/selectoperandscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OperationButton extends StatelessWidget {
  OperationButton({ Key? key, required this.operationType}) : super(key: key);

  final OperationType operationType;

  final CalculationService  _calculationService = getIt.get<CalculationService>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onOperationTapped(operationType),
      title: Text(
        operationType.customName,
        style: const TextStyle(fontSize: 25, color: Colors.white),
      ),
      leading: Text(operationType.symbol, style: TextStyle(fontSize: 25, color: Colors.white60)),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white60,),
    );
  }

  void onOperationTapped(OperationType value) {
    _calculationService.setScreenIndex(1);
    _calculationService.setOperationType(value);
    Get.to(const SelectOperandScreenView());
  }
}


