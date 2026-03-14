import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/utilities/launch_url.dart';
import 'package:portfolio/utilities/responsive.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 24 : 100,
      ),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: AppColors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text('05.', style: AppTextStyles.mono.copyWith(fontSize: 14)),
              const SizedBox(width: 24),
              const Expanded(
                child: Divider(color: AppColors.border, thickness: 1),
              ),
            ],
          ),
          const SizedBox(height: 60),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              'LET\'S TALK',
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
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSubtext(),
                    const SizedBox(height: 40),
                    _buildButton(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildSubtext()),
                    _buildButton(),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildSubtext() {
    return Text(
      // 'Whether you have a question or just want to say hi, my inbox is open.',
      "SYSTEMS ARE ONLINE. TRANSMIT YOUR MESSAGE OR INITIALIZE COLLABORATION SEQUENCE. DIRECT ALL INQUIRIES THROUGH SECURE CHANNELS.",
      style: AppTextStyles.mono.copyWith(
        fontSize: 12,
        color: AppColors.textSecondary,
        height: 1.5,
      ),
    );
  }

  Widget _buildButton() {
    return _BrutalistButton(
      text: 'SEND DISPATCH',
      onPressed: () => launchEmail(),
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
            color: _isHovered ? AppColors.accent : Colors.transparent,
            border: Border.all(
              width: 1,
              color: _isHovered ? AppColors.accent : AppColors.border,
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
