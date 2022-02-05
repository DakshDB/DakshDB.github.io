import 'package:flutter/material.dart';
import 'package:portfolio/utilities/launch_url.dart';

import 'custom_text.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.68,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: "Contact",
                textSize: 16.0,
                color: Color(0xff41FBDA),
                letterSpacing: 3.0,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const CustomText(
                text: "Get In Touch",
                textSize: 42.0,
                color: Colors.white,
                letterSpacing: 3.0,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Wrap(
                children: [
                  Text(
                    "Looking for a challenge? Need some work done? Contact me! I have the skills you are looking for.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      letterSpacing: 0.75,
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              OutlinedButton(
                onPressed: () {
                  launchEmail();
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  side: const BorderSide(width: 1.0, color: Color(0xff64FFDA)),
                ),
                child: const Text(
                  "Get In Touch",
                  style: TextStyle(
                    color: Color(0xff64FFDA),
                    letterSpacing: 2.75,
                    wordSpacing: 1.0,
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
