import 'package:flutter/material.dart';
import 'package:portfolio/widgets/contact.dart';
import 'package:portfolio/widgets/email_link.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/header.dart';
import 'package:portfolio/widgets/introduction.dart';
import 'package:portfolio/widgets/social_links.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scrollDirection = Axis.vertical;

  late AutoScrollController _autoScrollController;
  bool isExpanded = true;

  Future scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    );
    super.initState();
  }

  Widget _wrapScrollTag({int? index, Widget? child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index!,
      child: child,
    );
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
              height: size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.dashboard,
                          size: 32.0,
                          color: Color(0xff64FFDA),
                        ),
                        onPressed: () {
                          scrollToIndex(0);
                        }),
                    Header(
                      scrollToIndex: scrollToIndex,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.9,
              child: Row(
                children: [
                  //Social Icon
                  const SocialLinks(),

                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: CustomScrollView(
                            controller: _autoScrollController,
                            slivers: <Widget>[
                              SliverList(
                                  delegate: SliverChildListDelegate([
                                _wrapScrollTag(
                                    index: 0, child: const Introduction()),
                                _wrapScrollTag(
                                    index: 1, child: const Contact()),
                              ]))
                            ],
                          ),
                        ),
                        const Footer()
                      ],
                    ),
                  ),
                  const EmailLink(),
                ],
              ),
            ),
            //Footer
          ],
        ));
  }
}
