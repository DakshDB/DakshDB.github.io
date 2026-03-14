import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/screens/home.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final List<String> _bootLines = [
    "INITIALIZING KERNEL PROTOCOLS...",
    "MOUNTING /DEV/DB.SYS...",
    "LOADING ENCRYPTED ASSETS... [OK]",
    "ESTABLISHING SECURE HANDSHAKE...",
    "ACCESS GRANTED."
  ];

  final List<String> _visibleLines = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startBootSequence();
  }

  void _startBootSequence() {
    int index = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (index < _bootLines.length) {
        setState(() {
          _visibleLines.add(_bootLines[index]);
        });
        index++;
      } else {
        _timer?.cancel();
        // Wait a tiny bit and fade out to Home
        Future.delayed(const Duration(milliseconds: 600), () {
          if (mounted) {
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const Home(),
                transitionDuration: const Duration(milliseconds: 800),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          width: double.infinity,
          padding: const EdgeInsets.all(40),
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (String line in _visibleLines)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    line,
                    style: AppTextStyles.mono.copyWith(
                      color: line == "ACCESS GRANTED." ? AppColors.accent : AppColors.textSecondary,
                      fontWeight: line == "ACCESS GRANTED." ? FontWeight.bold : FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              if (_visibleLines.length < _bootLines.length)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "_",
                    style: AppTextStyles.mono.copyWith(
                      color: AppColors.accent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
