import 'package:flutter/material.dart';
import 'package:portfolio/screens/gallery.dart';

import 'custom_text.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      height: size.height * 0.96,
      child: Column(
        children: [
          (Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            height: size.height * 0.06,
            child: const Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "Gallery",
                  textSize: 28.0,
                  color: Color(0xffCCD6F6),
                  fontWeight: FontWeight.w700,
                )),
          )),
          Container(
            padding: EdgeInsets.fromLTRB(0, size.height * 0.1, 0, 0),
            height: size.height * 0.57,
            alignment: Alignment.topCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.height / 2.2,
                    width: size.width / 5,
                    color: Colors.black54,
                    child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage("images/one.png"),
                    ),
                  ),
                  Container(
                    height: size.height / 2.2,
                    width: size.width / 5,
                    color: Colors.black54,
                    child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage("images/two.png"),
                    ),
                  ),
                  Container(
                    height: size.height / 2.2,
                    width: size.width / 5,
                    color: Colors.black54,
                    child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage("images/three.png"),
                    ),
                  ),
                ]),
          ),
          SizedBox(
              height: size.height * 0.1,
              width: size.width * 0.72,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "View More",
                  style: TextStyle(
                    color: Color(0xff41FBDA),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
