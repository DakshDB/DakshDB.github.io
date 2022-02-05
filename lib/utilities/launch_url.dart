import 'package:portfolio/constants/info.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(String link) async {
  var url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

launchCaller() async {
  const url = "tel:" + phoneNumber;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

launchEmail() async {
  if (await canLaunch("mailto:" + emailID)) {
    await launch("mailto:" + emailID);
  } else {
    throw 'Could not launch';
  }
}
