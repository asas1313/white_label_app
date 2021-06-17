import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/styles.dart';
import '../widgets/services_slides/services_slides.dart';
import 'package:spaces/spaces.dart';

class ServicesPage extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: (constraints.maxWidth / 3) * 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Space.big(),
                Text(
                  'SERVICES',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: MAIN_THEME_COLOR,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Space.big(),
                Text(
                  'Exceeding Your Expectations',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                Space.big(),
                ServicesSlides(),
                Space.big(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
