import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../styles/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spaces/spaces.dart';

class ContactUsForm extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final questionController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        margin: spacing.insets.all.extraSmall,
        child: Container(
          padding: sizingInformation.isMobile
              ? spacing.insets.all.extraSmall
              : spacing.insets.all.big,
          width: sizingInformation.isMobile ? Get.width : Get.width * 0.35,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Space.normal(),
              TextFormField(initialValue: 'Message Form', readOnly: true),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Name: ',
                    labelStyle:
                        TextStyle(color: secondaryThemeColor.withOpacity(0.5))),
                style: TextStyle(color: secondaryThemeColor),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'E-mail: ',
                    labelStyle:
                        TextStyle(color: secondaryThemeColor.withOpacity(0.5))),
                style: TextStyle(color: secondaryThemeColor),
              ),
              TextFormField(
                controller: questionController,
                decoration: InputDecoration(
                    labelText: 'Question: ',
                    labelStyle:
                        TextStyle(color: secondaryThemeColor.withOpacity(0.5))),
                style: TextStyle(color: secondaryThemeColor),
              ),
              TextFormField(
                maxLines: 5,
                controller: messageController,
                decoration: InputDecoration(
                    labelText: 'Message: ',
                    labelStyle:
                        TextStyle(color: secondaryThemeColor.withOpacity(0.5))),
                style: TextStyle(color: secondaryThemeColor),
              ),
              Space.normal(),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: 135,
                  height: 50,
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: MAIN_THEME_COLOR),
                    onPressed: () => sendMessage(),
                    child: Text(
                      'SUBMIT',
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void sendMessage() {
    if (!emailController.text.isEmail ||
        (questionController.text.isEmpty && messageController.text.isEmpty)) {
      Get.snackbar(
        'Error',
        'Please provide your e-mail and question or message!',
        backgroundColor: Colors.red,
      );
      return null;
    }
    // FirebaseFirestore.instance.collection('mail').add({
    //   'to': 'andrius@modernit.space',
    //   'message': {
    //     'from': emailController.text,
    //     'subject': nameController.text + ' sent a message for You',
    //     'html': 'Name: ' +
    //         nameController.text +
    //         '.<br/>E-mail: ' +
    //         emailController.text +
    //         '.<br/>Question: ' +
    //         questionController.text +
    //         '.<br/>Message: ' +
    //         messageController.text,
    //   },
    // }).then((value) {
    Get.snackbar('Information', 'Message sent.');
    emailController.text = '';
    nameController.text = '';
    questionController.text = '';
    messageController.text = '';
    // }).catchError((error) {
    //   print("Failed to save email: $error");
    // });
    Get.back();
  }
}
