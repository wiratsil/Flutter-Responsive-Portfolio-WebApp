import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'drawer_image.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              accentPurple.withValues(alpha: 0.15),
              bgColor,
            ],
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            const DrawerImage(),
            const Spacer(),
            ShaderMask(
              shaderCallback: (bounds) => glowGradient.createShader(bounds),
              child: Text(
                'Wimutti Wiratsil',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
              ),
            ),
            const SizedBox(height: spacingXS),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: spacingSM,
                vertical: spacingXS,
              ),
              decoration: BoxDecoration(
                color: accentBlue.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(radiusSM),
              ),
              child: const Text(
                'Flutter & Unity Developer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: accentCyan,
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
