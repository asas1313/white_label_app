import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Center(
          child: GestureDetector(
              onTap: () {
                Get.snackbar('title', 'message');
              },
              child: Text(
                'Hello World',
              )),
        ),
      ),
    );
  }
}
