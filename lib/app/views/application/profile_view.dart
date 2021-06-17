import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/profile_controller.dart';
import 'widgets/authenticated.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widgets/avatar.dart';

class ProfileView extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: SingleChildScrollView(
          child: ResponsiveBuilder(builder: (context, sizingInformation) {
        var width = (sizingInformation.isDesktop) ? Get.width / 3 : Get.width;
        return Container(
          width: width,
          height: 900,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Avatar(
                  avatarUrl: controller.avatarUrl.value,
                  onTap: () => controller.setAvatar(),
                ),
                SizedBox(height: 15),
                TextFormField(
                  initialValue: controller.email,
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: controller.displayName,
                  decoration: InputDecoration(
                      labelText: 'Display name',
                      hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: controller.position,
                  decoration: InputDecoration(
                      labelText: 'Position',
                      hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: controller.phone,
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 10),
                Text('* Edited data is saved automatically.'),
                SizedBox(height: 35),
                TextFormField(
                  controller: controller.oldPassword,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                  autovalidateMode: AutovalidateMode.always,
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: controller.newPassword,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'New password'),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (controller.oldPassword.text.isNotEmpty &&
                        (value ?? '').isEmpty) {
                      return 'Password is required.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: controller.confirmPassword,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirm password'),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (value != controller.newPassword.text) {
                      return 'Passwords do not match.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    var _error = await controller.validatePassword();
                    if (_error == null) {
                      controller.changePassword();
                    } else {
                      Get.snackbar(
                        'Error',
                        _error,
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 5),
                      );
                    }
                  },
                  child: Text('Change password'),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        );
      })),
    );
  }
}
