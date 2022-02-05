import 'package:flutter/material.dart';
import 'package:portfolio/constants/info.dart';

class EmailLink extends StatelessWidget {
  const EmailLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.09,
      height: MediaQuery.of(context).size.height * 0.9,
      //color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RotatedBox(
            quarterTurns: 45,
            child: Text(
              emailID,
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
    );
  }
}
