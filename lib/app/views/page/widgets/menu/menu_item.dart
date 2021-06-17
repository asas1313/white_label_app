import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;

  const MenuItem({required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: child,
      ),
    );
  }
}
