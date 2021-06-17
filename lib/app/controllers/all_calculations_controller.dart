import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/app/models/calculation_model.dart';
import '/app/repositories/calculation_repository.dart';

class AllCalculationsController extends GetxController {
  var _calculations = <CalculationModel>[];
  final filterredCalculations = <CalculationModel>[].obs;

  final _repository = CalculationsRepository();

  final filterGreater = TextEditingController();
  final filterEquals = TextEditingController();
  final filterLess = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    refreshAll();
    filterGreater.addListener(_applyGreater);
    filterEquals.addListener(_applyEquals);
    filterLess.addListener(_applyLess);
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  clearFilters() {
    filterGreater.text = '';
    filterEquals.text = '';
    filterLess.text = '';
    filterredCalculations.value = _calculations;
  }

  _applyGreater() {
    filterredCalculations.value = _calculations.where((element) {
      return element.sumInitial.isGreaterThan(
          double.tryParse(filterGreater.text) ?? double.minPositive);
    }).toList();
  }

  _applyEquals() {
    filterredCalculations.value = _calculations.where((element) {
      return element.sumInitial
          .isEqual(double.tryParse(filterEquals.text) ?? element.sumInitial);
    }).toList();
  }

  _applyLess() {
    filterredCalculations.value = _calculations.where((element) {
      return element.sumInitial
          .isLowerThan(double.tryParse(filterLess.text) ?? double.maxFinite);
    }).toList();
  }

  void refreshAll() {
    _repository.getAllCalculations().then((value) {
      _calculations = value;
      filterredCalculations.value = value;
      print('-= calculations loaded: ${_calculations.length}. =-');
    });
  }
}
