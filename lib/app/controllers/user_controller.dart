import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/repositories/user_repository.dart';

class UserController extends GetxController {
  final role = ''.obs;
  final email = ''.obs;
  final displayName = ''.obs;
  final position = ''.obs;
  final phone = ''.obs;
  final enabled = false.obs;
  final avatarUrl = ''.obs;

  final _repository = UserRepository();

  @override
  void onReady() {
    super.onReady();
  }

  @mustCallSuper
  @override
  void onClose() {
    clearController();
    super.onClose();
  }

  loadController(String emailToLoad) {
    try {
      _repository.findUserByEmail(emailToLoad).then((model) {
        role.value = model.role;
        email.value = model.email;
        displayName.value = model.displayName;
        position.value = model.position;
        phone.value = model.phone;
        enabled.value = model.enabled;
        avatarUrl.value = model.avatarUrl;
      });
    } catch (e) {
      print('User' 's information loading error! \n $e');
    }
  }

  clearController() {
    role.value = '';
    email.value = '';
    displayName.value = '';
    position.value = '';
    phone.value = '';
    enabled.value = false;
    avatarUrl.value = '';
  }
}
