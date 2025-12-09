import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../../res/constants.dart';

class DrawerImage extends StatefulWidget {
  const DrawerImage({super.key});

  @override
  State<DrawerImage> createState() => _DrawerImageState();
}

class _DrawerImageState extends State<DrawerImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: 110,
          width: 110,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            gradient: SweepGradient(
              colors: const [
                accentPink,
                accentPurple,
                accentBlue,
                accentCyan,
                accentPink,
              ],
              transform: GradientRotation(_controller.value * 2 * math.pi),
            ),
            boxShadow: [
              BoxShadow(
                color: accentPink.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: accentBlue.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(56),
              color: bgColor,
            ),
            padding: const EdgeInsets.all(3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(53),
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
