import 'package:flutter/material.dart';

import 'custom_text.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 100),
      height: size.height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //About me
              SizedBox(
                height: size.height * 0.9,
                width: size.width / 2 - 100,
                child: Column(
                  children: [
                    //About me title
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const SizedBox(
                          width: 12.0,
                        ),
                        const CustomText(
                          text: "About",
                          textSize: 26.0,
                          color: Color(0xffCCD6F6),
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: size.width / 8,
                          height: 1.10,
                          color: const Color(0xff303C55),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Wrap(
                      children: const [
                        CustomText(
                          text:
                              "Full Stack Developer with experience in website development, mobile app development, backend servers and databases.\n\n",
                          textSize: 16.0,
                          color: Color(0xff828DAA),
                          letterSpacing: 0.75,
                        ),
                        CustomText(
                          text:
                              "A lazy tech nerd who loves food, puzzles and long exposure photography.",
                          textSize: 16.0,
                          color: Color(0xff828DAA),
                          letterSpacing: 0.75,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SizedBox(
                  height: size.height * 0.9,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff61F9D5),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff61F9D5),
                              blurRadius: 10,
                              offset:
                                  Offset(5, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: size.height / 2,
                              width: size.width / 5,
                              color: Colors.black54,
                              child: const Image(
                                fit: BoxFit.cover,
                                image: AssetImage("images/profile_picture.png"),
                              ),
                            ),
                            Container(
                              height: size.height / 2,
                              width: size.width / 5,
                              color: const Color(0x4061F9D5),
                            ),
                          ],
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
