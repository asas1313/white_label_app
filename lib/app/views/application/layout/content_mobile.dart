import 'package:flutter/material.dart';

class ContentMobile extends StatelessWidget {
  final child;

  const ContentMobile({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
