import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../styles/styles.dart';
import 'package:spaces/spaces.dart';

class Slide1 extends StatelessWidget {
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
          flex: 6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: spacing.insets.onlyBottom.normal,
                child: Text(
                  'Manufacturing improvements',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: spacing.insets.onlyBottom.normal,
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
                padding: spacing.insets.onlyBottom.normal,
                child: AutoSizeText(
                  'LEAN practice',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              AutoSizeText(
                '\u2022 SMED learning by doing - 30% to 90% decrease of equipment change-over time\n' +
                    '\u2022 5S make a better and safer workplace, 1 st results in one day\n' +
                    '\u2022 Workflow with value stream mapping - workshop layout (re)design  Stock improvement data analyses, MRP, kanban)',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                maxLines: 5,
                overflowReplacement: Text('Sorry text is too long'),
              ),
              AutoSizeText(
                'Process expertise focusing on added value and eliminate hidden waste, bottleneck, ...\n' +
                    'Quality and productivity analysis and solutions\n' +
                    'Continuous improvement deployment (Kaizen, 5 why,…)',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 12,
                ),
                maxLines: 5,
                overflowReplacement: Text('Sorry text is too long'),
              ),
              Padding(
                padding: spacing.insets.all.normal,
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                      width: 115,
                      height: 30,
                    ),
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: MAIN_THEME_COLOR),
                        onPressed: () => Get.toNamed('/contact'),
                        child: Text(
                          'Get In Touch',
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
