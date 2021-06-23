import 'package:flutter/material.dart';
import '/app/services/get_in_touch.dart';
import '../../styles/styles.dart';
import 'package:spaces/spaces.dart';
import 'package:url_launcher/url_launcher.dart';

import 'menu_item.dart';

class MenuContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MenuItem(
            child: Text(contactEmail),
            onPressed: () => getInTouch(),
          ),
          Space.small(),
          MenuItem(
            child: SelectableText(contactPhone),
          ),
          MenuItem(
            child: TextButton(
              onPressed: () => _openLinkedIn(),
              child: Image(
                  height: 14,
                  fit: BoxFit.contain,
                  image: AssetImage('assets/img/linkedin_logo_white.png')),
            ),
          ),
          Space.small(),
        ],
      ),
    );
  }

  _openLinkedIn() async {
    await canLaunch(linkedInAddress)
        ? await launch(linkedInAddress)
        : throw 'Could not launch $linkedInAddress';
  }
}
