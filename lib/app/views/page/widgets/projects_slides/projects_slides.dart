import 'package:flutter/material.dart';
import '../../widgets/projects_slides/expansion_slide.dart';
import '../../widgets/projects_slides/identity_slide.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spaces/spaces.dart';

class ProjectsSlides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        margin: spacing.insets.all.extraSmall,
        child: sizingInformation.isMobile
            ? Container(
                width: sizingInformation.screenSize.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: ExpansionSlide(),
                    ),
                    Flexible(
                      flex: 1,
                      child: IdentitySlide(),
                    ),
                  ],
                ),
              )
            : Container(
                width: sizingInformation.screenSize.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: ExpansionSlide()),
                    Expanded(child: IdentitySlide()),
                  ],
                ),
              ),
      ),
    );
  }
}
