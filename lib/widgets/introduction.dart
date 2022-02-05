import 'package:flutter/material.dart';

import 'custom_text.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            text: "Hello World,",
            textSize: 16.0,
            color: Color(0xff41FBDA),
            letterSpacing: 3.0,
          ),
          const SizedBox(
            height: 6.0,
          ),
          const CustomText(
            text: "Daksh Bhatia",
            textSize: 68.0,
            color: Color(0xffCCD6F6),
            fontWeight: FontWeight.w900,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Wrap(
            children: [
              CustomText(
                text: "Think",
                textSize: 46.0,
                color: const Color(0xffCCD6F6).withOpacity(0.6),
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: ".",
                textSize: 46.0,
                color: const Color(0xffCCD6F6).withOpacity(0.6),
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: "Plan",
                textSize: 46.0,
                color: const Color(0xffCCD6F6).withOpacity(0.6),
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: ".",
                textSize: 46.0,
                color: const Color(0xffCCD6F6).withOpacity(0.6),
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: "Build",
                textSize: 46.0,
                color: const Color(0xffCCD6F6).withOpacity(0.6),
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: ".",
                textSize: 46.0,
                color: const Color(0xffCCD6F6).withOpacity(0.6),
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
