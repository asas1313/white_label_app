import 'package:flutter/material.dart';
import '../../widgets/services_slides/analyzing_slide.dart';
import '../../widgets/services_slides/planning_slide.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spaces/spaces.dart';

class ServicesSlides extends StatelessWidget {
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
                      child: PlanningSlide(),
                    ),
                    Flexible(
                      flex: 1,
                      child: AnalyzingSlide(),
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
                    Expanded(child: PlanningSlide()),
                    Expanded(child: AnalyzingSlide()),
                  ],
                ),
              ),
      ),
    );
  }
}
