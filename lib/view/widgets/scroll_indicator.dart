import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../res/constants.dart';

/// Scroll indicator with bounce animation
class ScrollIndicator extends StatelessWidget {
  final VoidCallback? onTap;

  const ScrollIndicator({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Scroll Down',
            style: TextStyle(
              color: bodyTextColor.withValues(alpha: 0.6),
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: spacingXS),
          Container(
            width: 30,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radiusLG),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                width: 4,
                height: 10,
                decoration: BoxDecoration(
                  color: accentPink,
                  borderRadius: BorderRadius.circular(radiusSM),
                  boxShadow: [
                    BoxShadow(
                      color: accentPink.withValues(alpha: 0.5),
                      blurRadius: 6,
                    ),
                  ],
                ),
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .moveY(
                    begin: 0,
                    end: 20,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut,
                  )
                  .then()
                  .moveY(
                    begin: 20,
                    end: 0,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut,
                  ),
            ),
          ),
        ],
      )
          .animate()
          .fade(delay: const Duration(milliseconds: 1000))
          .slideY(begin: 0.5),
    );
  }
}
