import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/Widget/custom_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scrollDirection = Axis.vertical;

  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xff0A192F),
        body: Column(
          children: [
            SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 20.0),
                child: Row(
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.change_history,
                          size: 32.0,
                          color: Color(0xff64FFDA),
                        ),
                        onPressed: () {}),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                //Social Icon
                SizedBox(
                  width: size.width * 0.09,
                  height: size.height - 82,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: const FaIcon(FontAwesomeIcons.github),
                          color: const Color(0xffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {}),
                      IconButton(
                          icon: const FaIcon(FontAwesomeIcons.twitter),
                          color: const Color(0xffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {}),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.linkedin),
                        color: const Color(0xffA8B2D1),
                        onPressed: () {},
                        iconSize: 16.0,
                      ),
                      IconButton(
                          icon: const Icon(Icons.call),
                          color: const Color(0xffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {}),
                      IconButton(
                          icon: const Icon(Icons.mail),
                          color: const Color(0xffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {}),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: size.height * 0.20,
                          width: 2,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: size.height - 82,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * .06,
                        ),
                        const CustomText(
                          text: "Hello,",
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
                        CustomText(
                          text: "Think.Build",
                          textSize: 56.0,
                          color: const Color(0xffCCD6F6).withOpacity(0.6),
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: size.height * .04,
                        ),
                        SizedBox(
                          height: size.height * .12,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.07,
                  height: MediaQuery.of(context).size.height - 82,
                  //color: Colors.orange,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RotatedBox(
                        quarterTurns: 45,
                        child: Text(
                          "daksh2210@gmail.com",
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            letterSpacing: 3.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: 100,
                          width: 2,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
