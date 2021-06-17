import 'package:flutter/material.dart';
import 'package:wgite_label_app/app/views/application/layout/menu/menu_tablet.dart';
import 'package:wgite_label_app/app/views/page/widgets/menu/menu_contact.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'header_app_desktop.dart';
import 'header_app_mobile.dart';

class HeaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.isDesktop) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeaderAppDesktop(),
            Row(
              children: [
                Flexible(
                  flex: 8,
                  child: MenuTablet(),
                ),
                Flexible(
                  flex: 5,
                  child: MenuContact(),
                )
              ],
            ),
          ],
        );
      } else if (sizingInformation.isTablet) {
        return Column(
          children: [
            MenuContact(),
            HeaderAppDesktop(),
            MenuTablet(),
          ],
        );
      } else {
        return Column(
          children: [
            MenuContact(),
            HeaderAppMobile(),
          ],
        );
      }
    });
  }
}
