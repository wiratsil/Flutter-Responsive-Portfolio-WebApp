import 'package:flutter/material.dart';
import '../../../res/constants.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText({
    super.key,
    required this.start,
    required this.end,
  });

  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Text(
            'Crafting engaging cross-platform mobile apps with Flutter, and optimizing 2D/3D games with Unity, from concept to deployment.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: bodyTextColor,
              wordSpacing: 1.5,
              fontSize: value * 0.95,
              height: 1.6,
              letterSpacing: 0.3,
            ),
          ),
        );
      },
    );
  }
}
