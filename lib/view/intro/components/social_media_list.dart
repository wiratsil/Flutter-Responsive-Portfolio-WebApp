import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/social_media_coloumn.dart';
import '../../../res/constants.dart';

class SocialMediaIconList extends StatelessWidget {
  const SocialMediaIconList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Column(
            children: [
              const Spacer(),
              RotatedBox(
                quarterTurns: -3,
                child: ShaderMask(
                  shaderCallback: (bounds) => glowGradient.createShader(bounds),
                  child: Text(
                    'Follow Me',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.06,
                width: 3,
                margin: const EdgeInsets.symmetric(vertical: spacingMD),
                decoration: BoxDecoration(
                  gradient: glowGradient,
                  borderRadius: BorderRadius.circular(radiusMD),
                  boxShadow: [
                    BoxShadow(
                      color: accentPink.withValues(alpha: 0.5),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              const SocialMediaIconColumn(),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
