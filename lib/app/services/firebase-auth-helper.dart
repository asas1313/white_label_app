import 'package:firebase_auth/firebase_auth.dart';

import '../enums/auth-result-status.dart';

import 'auth-exception-handler.dart';

class FirebaseAuthHelper {
  final _auth = FirebaseAuth.instance;
  var _status = AuthResultStatus.undefined;

  AuthResultStatus get status => _status;

  ///
  /// Helper Functions
  ///

  Future<AuthResultStatus> createAccount({email, pass}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);
      if (userCredential.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  Future<AuthResultStatus> login({email, pass}) async {
    try {
      final authResult =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);

      if (authResult.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('Exception @login: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  logout() {
    _auth.signOut();
  }
}
