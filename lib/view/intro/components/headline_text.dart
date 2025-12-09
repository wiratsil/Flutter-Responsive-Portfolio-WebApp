import 'package:flutter/material.dart';
import '../../../res/constants.dart';

class MyPortfolioText extends StatelessWidget {
  const MyPortfolioText({super.key, required this.start, required this.end});
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey there, I\'m',
              style: TextStyle(
                fontSize: value * 0.4,
                color: bodyTextColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: spacingSM),
            ShaderMask(
              shaderCallback: (bounds) => glowGradient.createShader(bounds),
              child: Text(
                'WIMUTTI',
                style: TextStyle(
                  fontSize: value,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                  height: 1.1,
                ),
              ),
            ),
            Text(
              'WIRATSIL',
              style: TextStyle(
                fontSize: value * 0.9,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 3,
                height: 1.1,
              ),
            ),
          ],
        );
      },
    );
  }
}
