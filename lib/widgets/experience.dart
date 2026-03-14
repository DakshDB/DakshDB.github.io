import 'package:flutter/material.dart';
import 'package:portfolio/constants/experience_data.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/utilities/launch_url.dart';
import 'package:portfolio/utilities/responsive.dart';
import 'package:portfolio/widgets/section_wrapper.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      sectionNumber: '02.',
      sectionTitle: 'OPERATIONAL HISTORY',
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border), // Enclose the whole experience section
        ),
        child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 250,
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: AppColors.border)),
            ),
            child: _buildTabList(isVertical: true),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.border)),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(experiences.length, (i) => _buildTab(experiences[i].company, i, false)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildTabList({required bool isVertical}) {
    final tabs = experiences.map((e) => e.company).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(tabs.length, (i) => _buildTab(tabs[i], i, isVertical)),
    );
  }

  Widget _buildTab(String label, int index, bool isVertical) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : Colors.transparent,
          border: Border(
            bottom: isVertical && index < experiences.length - 1
               ? BorderSide(color: AppColors.border) 
               : BorderSide.none,
            right: !isVertical && index < experiences.length - 1
               ? BorderSide(color: AppColors.border)
               : BorderSide.none,
          ),
        ),
        child: Text(
          label.toUpperCase(),
          style: AppTextStyles.mono.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontSize: 13,
            color: isSelected ? AppColors.bgPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    final exp = experiences[_selectedIndex];
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isMobile)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exp.role.toUpperCase(),
                style: TextStyle(
                  fontFamily: AppTextStyles.h1.fontFamily,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.0,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(border: Border.all(color: AppColors.border)),
                child: Text(
                  exp.duration.toUpperCase(),
                  style: AppTextStyles.mono.copyWith(fontSize: 10, color: AppColors.textTertiary),
                ),
              ),
            ]
          )
        else 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  exp.role.toUpperCase(),
                  style: TextStyle(
                    fontFamily: AppTextStyles.h1.fontFamily,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1.0,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(border: Border.all(color: AppColors.border)),
                child: Text(
                  exp.duration.toUpperCase(),
                  style: AppTextStyles.mono.copyWith(fontSize: 10, color: AppColors.textTertiary),
                ),
              ),
            ],
          ),
        const SizedBox(height: 24),
        if (exp.companyUrl != null)
          GestureDetector(
             onTap: () => launchURL(exp.companyUrl!),
             child: Text(
               '@ ${exp.company.toUpperCase()}',
               style: AppTextStyles.mono.copyWith(
                 fontSize: 14,
                 color: AppColors.accent,
                 decoration: TextDecoration.underline,
               ),
             ),
          )
        else
          Text(
            '@ ${exp.company.toUpperCase()}',
            style: AppTextStyles.mono.copyWith(
              fontSize: 14,
              color: AppColors.accent,
            ),
          ),
        const SizedBox(height: 48),
        Text(
          exp.description.toUpperCase(),
          style: AppTextStyles.mono.copyWith(fontSize: 12, color: AppColors.textSecondary, height: 1.6),
        ),
        const SizedBox(height: 32),
        ...exp.highlights.map(
          (h) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('[>]', style: AppTextStyles.mono.copyWith(color: AppColors.accent, fontSize: 12)),
                 const SizedBox(width: 12),
                 Expanded(
                   child: Text(
                     h.toUpperCase(), 
                     style: AppTextStyles.mono.copyWith(fontSize: 11, color: AppColors.textTertiary, height: 1.5)
                   )
                 ),
               ],
            ),
          ),
        ),
      ],
    );
  }
}

