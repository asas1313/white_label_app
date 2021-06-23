import 'package:url_launcher/url_launcher.dart';

void getInTouch() async {
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'andrius@modernit.space',
      queryParameters: {'subject': 'Message from white label app visitor'});
  await canLaunch(_emailLaunchUri.toString())
      ? await launch(_emailLaunchUri.toString())
      : throw 'Could not launch $_emailLaunchUri';
}
