import 'package:flutter/material.dart';
import '../../widgets/menu/menu_browsing.dart';
import '../../widgets/menu/menu_contact.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'header_desktop.dart';
import 'header_mobile.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.isDesktop) {
        return Column(
          children: [
            HeaderDesktop(),
            Row(
              children: [
                Flexible(
                  flex: 7,
                  child: MenuBrowsing(),
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
            HeaderDesktop(),
            MenuBrowsing(),
          ],
        );
      } else {
        return Column(
          children: [
            MenuContact(),
            HeaderMobile(),
          ],
        );
      }
    });
  }
}
