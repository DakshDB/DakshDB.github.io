import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/utilities/responsive.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;
  final String? sectionTitle;
  final String? sectionNumber;

  const SectionWrapper({
    super.key,
    required this.child,
    this.sectionTitle,
    this.sectionNumber,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: 100,
      ),
      decoration: const BoxDecoration(
        border: Border(
           bottom: BorderSide(width: 1, color: AppColors.border),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (sectionTitle != null) ...[
            Row(
              children: [
                if (sectionNumber != null)
                  Text(sectionNumber!, style: AppTextStyles.mono.copyWith(fontSize: 14)),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 1,
                    color: AppColors.border,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              sectionTitle!.toUpperCase(),
              style: TextStyle(
                fontFamily: AppTextStyles.h1.fontFamily,
                fontSize: isMobile ? 48 : 80,
                fontWeight: FontWeight.w900,
                letterSpacing: -2.0,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 60),
          ],
          child,
        ],
      ),
    );
  }
}
