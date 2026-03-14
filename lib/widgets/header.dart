import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/utilities/responsive.dart';

class Header extends StatelessWidget {
  final Future<dynamic> Function(int) scrollToIndex;
  const Header({super.key, required this.scrollToIndex});

  static const List<String> _navItems = [
    '01. About',
    '02. Experience',
    '03. Projects',
    '04. Gallery',
    '05. Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    if (isDesktop) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < _navItems.length; i++) ...[
            _NavLink(
              text: _navItems[i],
              onTap: () => scrollToIndex(i + 1),
            ),
            if (i < _navItems.length - 1) const SizedBox(width: 8),
          ],
        ],
      );
    }

    return IconButton(
      icon: Icon(Icons.menu, color: AppColors.textSecondary),
      onPressed: () => _showMobileMenu(context),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgSecondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < _navItems.length; i++)
              ListTile(
                title: Text(_navItems[i], style: AppTextStyles.navLink),
                onTap: () {
                  Navigator.pop(context);
                  scrollToIndex(i);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const _NavLink({required this.text, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            widget.text,
            style: AppTextStyles.navLink.copyWith(
              color: _isHovered ? AppColors.accent : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
