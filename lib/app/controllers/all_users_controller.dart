import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/repositories/user_repository.dart';

class AllUsersController extends GetxController {
  final firestore = UserRepository();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  changeUserMode(String email, bool enabled) {
    firestore.setEnabled(email: email, enabled: enabled);
    Get.snackbar(
      'Information',
      'User' 's access mode was changed',
      backgroundColor: Colors.white,
    );
  }
}
