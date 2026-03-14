import 'package:portfolio/constants/info.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String link) async {
  final uri = Uri.parse(link);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $link';
  }
}

Future<void> launchCaller() async {
  final uri = Uri.parse("tel:$phoneNumber");
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch phone';
  }
}

Future<void> launchEmail() async {
  final uri = Uri.parse("mailto:$emailID");
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch email';
  }
}
