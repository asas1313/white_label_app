import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/footer/footer.dart';
import '../../widgets/header/header.dart';
import '../../widgets/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PageLayout extends GetWidget {
  final Widget child;

  PageLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.isMobile ? NavigationDrawer() : null,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              child,
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
