import 'package:flutter/material.dart';

import 'tab_title.dart';

class Header extends StatelessWidget {
  final Future<dynamic> Function(int) scrollToIndex;
  const Header({Key? key, required this.scrollToIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colors.transparent,
        onTap: (index) {
          scrollToIndex(index + 1);
        },
        tabs: const [
          Tab(
            child: TabTitle(
              text: 'Contact',
            ),
          ),
        ],
      ),
    );
  }
}
