import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/auth_controller.dart';
import '/app/models/calculation_model.dart';
import '/app/repositories/calculation_repository.dart';
import 'package:money_converter/Currency.dart';
import 'package:money_converter/money_converter.dart';

class CalculatorController extends GetxController {
  final _repository = CalculationsRepository();
  final email = ''.obs;
  final inputController = TextEditingController();
  final responseController = TextEditingController();
  final opertationTime = DateTime.now().obs;
  final currencyRateController = TextEditingController();

  void calculate() async {
    var _initial = double.tryParse(inputController.text) ?? 0;
    var _currencyRate = double.tryParse(currencyRateController.text) ?? 0;
    final _sum = _initial * 0.003 + 3.5;
    MoneyConverter.convert(
            Currency(Currency.USD, amount: 1), Currency(Currency.EUR))
        .then((value) {
      if (value != null) {
        currencyRateController.text = value.toStringAsPrecision(2);
        _currencyRate = value;
      }
      _repository.addCalculation(
          email: Get.find<AuthController>().email.text,
          operationTime: DateTime.now(),
          sumInitial: _initial,
          sumCalculated: _sum,
          currencyRate: _currencyRate);
      responseController.text = _sum.toStringAsFixed(2);
    });
  }

  loadController(CalculationModel model) {
    email.value = model.email;
    inputController.text = model.sumInitial.toString();
    responseController.text = model.sumCalculated.toString();
    opertationTime.value = model.operationTime;
    currencyRateController.text = model.currencyRate.toString();
  }
}
