import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  final _firestore = FirebaseFirestore.instance.collection('settings');

  Future<String> getDBVersion() async {
    final _snapshot = await _firestore.doc('main').get();
    final _version = _snapshot.data()!.containsKey('db_version')
        ? _snapshot.data()!['db_version']
        : '';
    return _version;
  }
}
