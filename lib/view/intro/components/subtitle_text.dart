import 'package:flutter/material.dart';
import '../../../res/constants.dart';

class AnimatedSubtitleText extends StatelessWidget {
  final double start;
  final double end;
  final String text;
  final bool gradient;

  const AnimatedSubtitleText({
    super.key,
    required this.start,
    required this.end,
    required this.text,
    this.gradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Text(
          text,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
                shadows: gradient
                    ? [
                        Shadow(
                          color: accentPink.withValues(alpha: 0.8),
                          offset: const Offset(0, 2),
                          blurRadius: 15,
                        ),
                        Shadow(
                          color: accentBlue.withValues(alpha: 0.6),
                          offset: const Offset(0, -2),
                          blurRadius: 15,
                        ),
                      ]
                    : [],
                height: 1.1,
                fontSize: value,
              ),
        );
      },
    );
  }
}
