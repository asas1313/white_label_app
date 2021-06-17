import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wgite_label_app/app/enums/auth-result-status.dart';
import 'package:wgite_label_app/app/services/auth-exception-handler.dart';
import 'package:wgite_label_app/app/services/firebase-auth-helper.dart';
import '/app/controllers/user_controller.dart';
import '/app/models/user_model.dart';
import '/app/routes/app_routing.dart';
import '/app/repositories/user_repository.dart';

class AuthController extends GetxController {
  final email = TextEditingController(text: '');
  final password = TextEditingController(text: '');
  final passwordConfirm = TextEditingController();

  final _auth = FirebaseAuth.instance;

  var logedIn = false.obs;

  @override
  onReady() {
    super.onReady();
    _subscribeToAuthStateChange();
  }

  _subscribeToAuthStateChange() {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently loged out!');
        logedIn.value = false;
        Get.find<UserController>().clearController();
      } else {
        print('User ${user.email} is loged in!');
        logedIn.value = true;
        Get.find<UserController>().loadController(user.email ?? '');
      }
    });
  }

  String? validate() {
    if (email.text.isEmpty) {
      return 'E-mail must be provided.';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text)) {
      return 'Not valid e-mail.';
    }
    if (password.text.isEmpty) {
      return 'Password must be provided.';
    }
    if (password.text != passwordConfirm.text) {
      return 'Passwords do not match.';
    }
    return null;
  }

  createAccount() async {
    print('create account: ${email.text}');
    var _status = await FirebaseAuthHelper()
        .createAccount(email: email.text, pass: password.text);
    if (_status != AuthResultStatus.successful) {
      final errorMsg = AuthExceptionHandler.generateExceptionMessage(_status);
      Get.snackbar('Error', errorMsg, backgroundColor: Colors.red);
    } else {
      var _userModel = UserModel(
        role: 'user',
        email: email.text,
      );
      if (await UserRepository().saveUser(_userModel)) {
        login();
        Get.back();
      }
    }
  }

  login({bool goToHome = false}) async {
    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar('Message', 'Enter email and password.');
      return;
    }

    var _status = await FirebaseAuthHelper()
        .login(email: email.text, pass: password.text);
    if (_status != AuthResultStatus.successful) {
      final errorMsg = AuthExceptionHandler.generateExceptionMessage(_status);
      Get.snackbar('Error', errorMsg, backgroundColor: Colors.red);
      return;
    }
    final _controller = Get.find<UserController>();
    _controller.loadController(email.text);
    logedIn.value = true;
    if (goToHome) {
      Get.toNamed(Routes.APP);
    }
  }

  logout() async {
    await FirebaseAuthHelper().logout();
    Get.find<UserController>().clearController();
    logedIn.value = false;
    email.text = '';
    password.text = '';
    Get.offAllNamed(Routes.APP);
  }

  Future<String?> validatePassword(String password) async {
    var _user = _auth.currentUser;
    if (_user != null) {
      var _authCredentials =
          EmailAuthProvider.credential(email: _user.email!, password: password);
      try {
        _user.reauthenticateWithCredential(_authCredentials).then((value) {
          return value.user == null ? null : 'You are not loggedin!';
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-mismatch') {
          return 'The credential given does not correspond to the user.';
        } else if (e.code == 'user-not-found') {
          return 'The credential given does not correspond to the user.';
        } else if (e.code == 'invalid-credential') {
          return 'The provider' 's credential is not valid.';
        } else if (e.code == 'invalid-email') {
          return 'The provider' 's email is not valid.';
        } else if (e.code == 'wrong-password') {
          return 'The provided password is not valid.';
        } else {
          print(e.toString());
          return 'Authentication error!';
        }
      } catch (e) {
        print(e.toString());
        return 'Password check error!';
      }
    } else {
      Get.snackbar('Error', 'You are not logged in!');
      return 'You are not logged in!';
    }
  }

  changePassword({required String password, required String passwordConfirm}) {
    var _user = _auth.currentUser;

    if (password.isEmpty) {
      return 'Password must be provided.';
    }
    if (password != passwordConfirm) {
      return 'Passwords do not match.';
    }

    if (_user != null) {
      _user
          .updatePassword(password)
          .then((value) => print('Password successfully changed.'))
          .catchError((error) {
        print('Password could not be changed: \n${error.toString()}');
      });
    } else {
      Get.snackbar('Error', 'You are not logged in!');
    }
  }

  void resetPassword() {
    Get.defaultDialog(
        title: 'Alert',
        content: Text('Do You really want to reset your password?'),
        onCancel: () => Get.back(),
        onConfirm: () {
          _auth.sendPasswordResetEmail(email: email.text);
          Get.back();
        });
  }
}
