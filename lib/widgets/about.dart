import 'package:flutter/material.dart';
import 'package:portfolio/constants/info.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/utilities/responsive.dart';
import 'package:portfolio/widgets/section_wrapper.dart';

class About extends StatelessWidget {
  const About({super.key});

  static const List<String> skills = [
    'Dart',
    'Flutter',
    'Go',
    'Next.js',
    'Python',
    'Node.js',
    'Microservices',
    'AI/ML',
    'TensorFlow',
    'Git',
    'Firebase',
    'REST APIs',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      sectionNumber: '01.',
      sectionTitle: 'SYSTEM ARCHITECTURE', // Renamed for tech vibe
      child: isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: _buildTextContent(),
        ),
        const SizedBox(width: 64),
        Expanded(
          flex: 3,
          child: _buildProfileImage(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildTextContent(),
        const SizedBox(height: 60),
        _buildProfileImage(),
      ],
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aboutBio.toUpperCase(), 
          style: AppTextStyles.mono.copyWith(
            fontSize: 13,
            color: AppColors.textSecondary,
            height: 1.6,
          )
        ),
        const SizedBox(height: 48),
        Text(
          '// CORE STACK:',
          style: AppTextStyles.mono.copyWith(color: AppColors.accent, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((skill) => _buildSkillTag(skill)).toList(),
        ),
      ],
    );
  }

  Widget _buildSkillTag(String skill) {
    return _InteractiveSkillTag(skill: skill);
  }

  Widget _buildProfileImage() {
    return const _InteractiveProfileImage();
  }
}

class _InteractiveSkillTag extends StatefulWidget {
  final String skill;
  const _InteractiveSkillTag({required this.skill});

  @override
  State<_InteractiveSkillTag> createState() => _InteractiveSkillTagState();
}

class _InteractiveSkillTagState extends State<_InteractiveSkillTag> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.accent : Colors.transparent,
          border: Border.all(color: _isHovered ? AppColors.accent : AppColors.border),
        ),
        child: Text(
          widget.skill.toUpperCase(), 
          style: AppTextStyles.mono.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: _isHovered ? AppColors.bgPrimary : AppColors.textPrimary,
          )
        ),
      ),
    );
  }
}

class _InteractiveProfileImage extends StatefulWidget {
  const _InteractiveProfileImage();

  @override
  State<_InteractiveProfileImage> createState() => _InteractiveProfileImageState();
}

class _InteractiveProfileImageState extends State<_InteractiveProfileImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: _isHovered ? AppColors.accent : AppColors.border, width: 1),
        ),
        child: const Image(
          fit: BoxFit.cover,
          width: double.infinity,
          image: AssetImage("images/profile_picture.png"),
        ),
      ),
    );
  }
}
