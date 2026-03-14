import 'package:flutter/material.dart';
import 'package:portfolio/constants/info.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/utilities/responsive.dart';
import 'package:portfolio/utilities/launch_url.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: 120,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: AppColors.border),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              _BlinkingTerminalText(text: '// ${heroGreeting.toUpperCase()}'),
              const SizedBox(width: 24),
              const Expanded(child: Divider(color: AppColors.border, thickness: 1)),
            ],
          ),
          const SizedBox(height: 40),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              name.toUpperCase(),
              style: TextStyle(
                fontFamily: AppTextStyles.h1.fontFamily,
                fontSize: 160,
                fontWeight: FontWeight.w900,
                height: 0.9,
                letterSpacing: -4.0,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                fontFamily: AppTextStyles.h1.fontFamily,
                fontSize: 100,
                fontWeight: FontWeight.w900,
                height: 0.9,
                letterSpacing: -3.0,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              heroBio.toUpperCase(), 
              style: AppTextStyles.mono.copyWith(
                fontSize: 13,
                height: 1.6,
                color: AppColors.textTertiary,
              )
            ),
          ),
          const SizedBox(height: 60),
          _BrutalistButton(
            text: 'INITIALIZE SEQUENCE',
            onPressed: () => launchEmail(),
          ),
        ],
      ),
    );
  }
}

class _BrutalistButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const _BrutalistButton({required this.text, required this.onPressed});

  @override
  State<_BrutalistButton> createState() => _BrutalistButtonState();
}

class _BrutalistButtonState extends State<_BrutalistButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.textPrimary : Colors.transparent,
            border: Border.all(
              width: 1, 
              color: _isHovered ? AppColors.textPrimary : AppColors.border
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontFamily: AppTextStyles.mono.fontFamily,
              fontSize: 14,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
              color: _isHovered ? AppColors.bgPrimary : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class _BlinkingTerminalText extends StatefulWidget {
  final String text;
  const _BlinkingTerminalText({required this.text});

  @override
  State<_BlinkingTerminalText> createState() => _BlinkingTerminalTextState();
}

class _BlinkingTerminalTextState extends State<_BlinkingTerminalText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.text,
          style: AppTextStyles.mono.copyWith(
              color: AppColors.accent, fontWeight: FontWeight.bold),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _controller.value > 0.5 ? 1.0 : 0.0,
              child: Text(
                '_',
                style: AppTextStyles.mono.copyWith(
                    color: AppColors.accent, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ],
    );
  }
}

