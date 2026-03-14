import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/info.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/utilities/launch_url.dart';
import 'package:portfolio/utilities/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = !Responsive.isDesktop(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: AppColors.border),
        ),
      ),
      child: Column(
        children: [
          if (isMobile) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.github, size: 16),
                  color: AppColors.textTertiary,
                  onPressed: () => launchURL(github),
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.xTwitter, size: 16),
                  color: AppColors.textTertiary,
                  onPressed: () => launchURL(x),
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedin, size: 16),
                  color: AppColors.textTertiary,
                  onPressed: () => launchURL(linkedin),
                ),
                IconButton(
                  icon: const Icon(Icons.mail_outline, size: 16),
                  color: AppColors.textTertiary,
                  onPressed: () => launchEmail(),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
          Text(
            'DESIGNED & BUILT BY DAKSH BHATIA.',
            style: AppTextStyles.mono.copyWith(fontSize: 10, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
