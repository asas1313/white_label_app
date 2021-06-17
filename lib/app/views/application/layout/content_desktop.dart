import 'package:flutter/material.dart';

class ContentDesktop extends StatelessWidget {
  final child;

  const ContentDesktop({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
