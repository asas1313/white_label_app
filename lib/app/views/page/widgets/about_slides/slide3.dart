import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../styles/styles.dart';
import 'package:spaces/spaces.dart';

class Slide3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 2,
          child: TextButton(
            onPressed: () => Get.toNamed('/'),
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints.loose(Size.fromHeight(200)),
              decoration: logo,
            ),
          ),
        ),
        Space.small(),
        Flexible(
          flex: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: spacing.insets.onlyBottom.semiSmall,
                child: Text(
                  'Business',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: spacing.insets.onlyBottom.semiSmall,
                child: Text(
                  'ADVISE & EXECUTION SERVICES',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: MAIN_THEME_COLOR,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: spacing.insets.onlyBottom.semiSmall,
                child: AutoSizeText(
                  '\u2022 Sales development to French speaking countries\n' +
                      '\u2022 Purchasing strategy and process (how to buy better)\n' +
                      '\u2022 ERP deployment and optimization',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  maxLines: 6,
                  overflowReplacement: Text('Sorry text is too long'),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: 115,
                  height: 30,
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: MAIN_THEME_COLOR),
                    onPressed: () => Get.toNamed('/contact'),
                    child: Text(
                      'Get In Touch',
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
