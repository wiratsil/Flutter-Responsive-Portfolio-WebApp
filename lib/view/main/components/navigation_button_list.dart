import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import '../../../res/constants.dart';
import 'navigation_button.dart';

class NavigationButtonList extends StatelessWidget {
  const NavigationButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 400),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: spacingMD,
              vertical: spacingSM,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.03),
              borderRadius: BorderRadius.circular(radiusXL),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildNavButton(context, 0, 'Home', Icons.home_rounded),
                _buildNavButton(context, 1, 'About', Icons.person_rounded),
                _buildNavButton(context, 2, 'Projects', Icons.work_rounded),
                _buildNavButton(
                    context, 3, 'Certifications', Icons.verified_rounded),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavButton(
      BuildContext context, int index, String text, IconData icon) {
    return NavigationTextButton(
      onTap: () {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      text: text,
      icon: Responsive.isTablet(context) ? null : icon,
    );
  }
}
