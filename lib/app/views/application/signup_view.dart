import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaces/spaces.dart';
import 'styles/text_styles.dart';
import '/app/controllers/auth_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignupView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          var textAlignment = TextStyles.getTextAlignment(sizingInformation);
          var titleSize = TextStyles.getTitleSize(sizingInformation);
          return Container(
            width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Space.big(),
                Text(
                  'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      height: 1.1,
                      fontSize: titleSize,
                      letterSpacing: 3),
                  textAlign: textAlignment,
                ),
                Divider(),
                Space.normal(),
                TextFormField(
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value ?? '')) {
                      return null;
                    }
                    return 'Enter valid e-mail address.';
                  },
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                Space.normal(),
                TextFormField(
                  controller: controller.password,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return 'Password is required.';
                    }
                    return null;
                  },
                ),
                Space.normal(),
                TextFormField(
                  controller: controller.passwordConfirm,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirm password'),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (value != controller.password.text) {
                      return 'Passwords do not match.';
                    }
                    return null;
                  },
                ),
                Space.normal(),
                ElevatedButton(
                  onPressed: () {
                    var _error = controller.validate();
                    if (_error == null) {
                      controller.createAccount();
                    } else {
                      Get.snackbar(
                        'Error',
                        _error,
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 5),
                      );
                    }
                  },
                  child: Text('Sign Up'),
                ),
                Space.big(),
              ],
            ),
          );
        },
      ),
    );
  }
}
