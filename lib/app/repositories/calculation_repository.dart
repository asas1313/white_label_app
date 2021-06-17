import 'package:cloud_firestore/cloud_firestore.dart';
import '/app/models/calculation_model.dart';

class CalculationsRepository {
  final _calculations = FirebaseFirestore.instance.collection('calculations');
  final _email = FirebaseFirestore.instance.collection('mail');

  Future<void> addCalculation({
    required String email,
    required DateTime operationTime,
    required double sumInitial,
    required double sumCalculated,
    required double currencyRate,
  }) {
    _calculations
        .doc('${operationTime.toString()}_$email')
        .set({
          'email': email,
          'operationTime': operationTime,
          'sum_initial': sumInitial,
          'sum_calculated': sumCalculated,
          'currencyRate': currencyRate,
        })
        .then((value) => print('Sum added to collection'))
        .catchError((error) => print('Failed to add sum: $error'));

    return _email
        .add({
          'to': 'hello@inkubox.com',
          'message': {
            'subject': 'Calculation made in Inkubox App',
            'html':
                'email: $email,<br/>time: ${operationTime.toIso8601String()},<br/>initial sum: ${sumInitial.toString()},<br/>calculated sum: ${sumCalculated.toString()},<br/>currency rate: ${currencyRate.toString()}',
          },
        })
        .then((value) => print('Queued email for delivery!'))
        .catchError((error) => print('Failed to add sum: $error'));
  }

  Future<List<CalculationModel>> getAllCalculations() async {
    var _list = List<CalculationModel>.empty(growable: true);
    try {
      var _docs =
          await _calculations.orderBy('operationTime', descending: true).get();
      _docs.docs.forEach((element) {
        _list.add(
            CalculationModel.fromDocumentSnapshot(documentSnapshot: element));
      });
      return _list;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<CalculationModel> findCalculationById(String id) async {
    var _calculationModel;
    try {
      final snapshot = await _calculations.doc(id).get();
      _calculationModel =
          CalculationModel.fromDocumentSnapshot(documentSnapshot: snapshot);
      print(
          'Calculation from firestore loaded: ${_calculationModel.toString()}');
      return _calculationModel;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
