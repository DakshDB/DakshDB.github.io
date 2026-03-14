import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/info.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/utilities/launch_url.dart';
import 'package:portfolio/utilities/responsive.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Responsive.isDesktop(context)) return const SizedBox.shrink();

    return Container(
      width: 100,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color: AppColors.border),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _SocialIcon(
            icon: const FaIcon(FontAwesomeIcons.github, size: 20),
            onTap: () => launchURL(github),
          ),
          const SizedBox(height: 16),
          _SocialIcon(
            icon: const FaIcon(FontAwesomeIcons.xTwitter, size: 20),
            onTap: () => launchURL(x),
          ),
          const SizedBox(height: 16),
          _SocialIcon(
            icon: const FaIcon(FontAwesomeIcons.linkedin, size: 20),
            onTap: () => launchURL(linkedin),
          ),
          const SizedBox(height: 16),
          _SocialIcon(
            icon: const Icon(Icons.mail_outline, size: 20),
            onTap: () => launchEmail(),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final Widget icon;
  final VoidCallback onTap;
  const _SocialIcon({required this.icon, required this.onTap});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: IconTheme(
            data: IconThemeData(
              color: _isHovered ? AppColors.accent : AppColors.textTertiary,
            ),
            child: widget.icon,
          ),
        ),
      ),
    );
  }
}
