import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../styles/styles.dart';
import '../widgets/about_slides/about_slider.dart';
import 'package:spaces/spaces.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
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
                  companyName.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: MAIN_THEME_COLOR,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Space.big(),
                Text(
                  'Bringing Solutions for Success',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                Space.big(),
                Container(
                  padding: spacing.insets.all.small,
                  child: AutoSizeText(
                    'Active in:',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                AutoSizeText(
                  '\u2022 Manufacturing industry\n' +
                      '\u2022 Food packaging\n' +
                      '\u2022 Health care\n',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                Space.normal(),
                Container(
                  padding: spacing.insets.all.small,
                  child: AutoSizeText(
                    'Background:',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Space.normal(),
                AutoSizeText(
                  'Engineer & manager, French, located in Vilnius with experience and proven success in:\n' +
                      '1. international project & change management (corporate level)\n' +
                      '2. manufacturing and industrial engineering\n' +
                      '3. LEAN and CIP expertise\n' +
                      '4. SAP MM key-user\n' +
                      '5. indirect purchasing (services, investments, consumables,…)\n' +
                      '6. process standardization (cross company and culture)\n' +
                      '7. EFQM Excellence Model deployment (Prize winner 2011) efqm.org',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                AboutSlider(),
                Space.big(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
