import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/utilities/responsive.dart';
import 'package:portfolio/widgets/about.dart';
import 'package:portfolio/widgets/contact.dart';
import 'package:portfolio/widgets/email_link.dart';
import 'package:portfolio/widgets/experience.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/gallery.dart';
import 'package:portfolio/widgets/header.dart';
import 'package:portfolio/widgets/introduction.dart';
import 'package:portfolio/widgets/projects.dart';
import 'package:portfolio/widgets/social_links.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AutoScrollController _autoScrollController;

  Future<void> scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
    );
    _autoScrollController.highlight(index);
  }

  @override
  void initState() {
    super.initState();
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );
  }

  @override
  void dispose() {
    _autoScrollController.dispose();
    super.dispose();
  }

  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = Responsive.value<double>(
      context,
      mobile: 0,
      desktop: 40,
    );

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: Column(
        children: [
          // Top navigation bar
          Container(
            height: 64,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding + 16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: AppColors.border),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => scrollToIndex(0),
                  child: Text(
                    'DB',
                    style: AppTextStyles.h3.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Header(scrollToIndex: scrollToIndex),
              ],
            ),
          ),

          // Main content area
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SocialLinks(),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: [
                            SliverList(
                              delegate: SliverChildListDelegate([
                                _wrapScrollTag(
                                  index: 0,
                                  child: const Introduction(),
                                ),
                                _wrapScrollTag(
                                  index: 1,
                                  child: const About(),
                                ),
                                _wrapScrollTag(
                                  index: 2,
                                  child: const ExperienceSection(),
                                ),
                                _wrapScrollTag(
                                  index: 3,
                                  child: const Projects(),
                                ),
                                _wrapScrollTag(
                                  index: 4,
                                  child: const Gallery(),
                                ),
                                _wrapScrollTag(
                                  index: 5,
                                  child: const Contact(),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      const Footer(),
                    ],
                  ),
                ),
                const EmailLink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
