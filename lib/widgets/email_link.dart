import 'package:flutter/material.dart';
import 'package:portfolio/constants/info.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/utilities/responsive.dart';

class EmailLink extends StatelessWidget {
  const EmailLink({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Responsive.isDesktop(context)) return const SizedBox.shrink();

    return Container(
      width: 100,
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(width: 1, color: AppColors.border),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Text(
              emailID.toUpperCase(),
              style: AppTextStyles.mono.copyWith(
                color: AppColors.textSecondary,
                fontSize: 12,
                letterSpacing: 4.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
