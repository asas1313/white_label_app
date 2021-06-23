import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import '/app/services/get_in_touch.dart';
import '../../styles/colors.dart';
import '../../styles/styles.dart';
import 'package:spaces/spaces.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: footerColor,
      ),
      Container(
        color: MAIN_THEME_COLOR,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.normal(),
                SelectableText(
                  companyName,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Space.normal(),
                SelectableText(
                  companyAddress,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Space.small(),
                SelectableText(
                  contactPhone,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Space.big(),
              ],
            ),
            SizedBox(
                height: 60,
                width: 150,
                child: ElevatedButton(
                  onPressed: () => getInTouch(),
                  child: Text('Get In Touch'),
                ))
          ],
        ),
      ),
      Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Linkify(
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  throw 'Could not launch $link';
                }
              },
              text:
                  '©2021 by ModernIT. Proudly created by https://ModernIT.space',
              style: TextStyle(color: Colors.white),
              linkStyle: TextStyle(color: Colors.lightBlue),
            ),
            TextButton(
              onPressed: () => _openLinkedIn(),
              child: Image(
                  height: 14,
                  fit: BoxFit.contain,
                  image: AssetImage('assets/img/linkedin_logo_white.png')),
            ),
          ],
        ),
      )
    ]);
  }

  _openLinkedIn() async {
    await canLaunch(
            'https://www.linkedin.com/company/modernios-informacines-technologijos/')
        ? await launch(
            'https://www.linkedin.com/company/modernios-informacines-technologijos/')
        : throw 'Could not launch LinkedIn profile';
  }
}
