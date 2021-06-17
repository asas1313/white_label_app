import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'menu/menu.dart';
import '../widgets/check_version.dart';

import 'content_desktop.dart';
import 'content_mobile.dart';
import 'footer.dart';
import 'navigation_drawer.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;

  const LayoutTemplate({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CheckVersion(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          drawer: sizingInformation.isMobile ? NavigationDrawer() : null,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Menu(),
                FittedBox(
                  child: ScreenTypeLayout(
                    mobile: ContentMobile(
                      child: child,
                    ),
                    desktop: ContentDesktop(
                      child: child,
                    ),
                  ),
                ),
                FooterApp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
