import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/info.dart';
import 'package:portfolio/utilities/launch_url.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var ratio = size.width > 800 ? 0.09 : (size.width > 450 ? 0.12 : 0.18);
    return SizedBox(
      width: size.width * ratio,
      height: size.height * 0.9,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                color: const Color(0xffA8B2D1),
                iconSize: 16.0,
                onPressed: () {
                  launchURL(github);
                }),
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.twitter),
                color: const Color(0xffA8B2D1),
                iconSize: 16.0,
                onPressed: () {
                  launchURL(twitter);
                }),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.linkedin),
              color: const Color(0xffA8B2D1),
              onPressed: () {
                launchURL(linkedin);
              },
              iconSize: 16.0,
            ),
            IconButton(
                icon: const Icon(Icons.call),
                color: const Color(0xffA8B2D1),
                iconSize: 16.0,
                onPressed: () {
                  launchCaller();
                }),
            IconButton(
                icon: const Icon(Icons.mail),
                color: const Color(0xffA8B2D1),
                iconSize: 16.0,
                onPressed: () {
                  launchEmail();
                }),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: 3,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
