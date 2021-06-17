import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? avatarUrl;
  final VoidCallback? onTap;

  const Avatar({this.avatarUrl, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: (avatarUrl == null || avatarUrl!.isEmpty)
            ? CircleAvatar(
                radius: 50.0,
                child: Icon(Icons.photo_camera),
              )
            : CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(avatarUrl!),
              ),
      ),
    );
  }
}
