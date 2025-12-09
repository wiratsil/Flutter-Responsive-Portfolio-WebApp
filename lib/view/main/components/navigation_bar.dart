import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/intro/components/side_menu_button.dart';
import 'package:flutter_portfolio/view/main/components/connect_button.dart';
import '../../../res/constants.dart';
import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.03),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withValues(alpha: 0.05),
                width: 1,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: !Responsive.isLargeMobile(context)
                    ? _buildLogo()
                    : MenuButton(
                        onTap: () => Scaffold.of(context).openDrawer(),
                      ),
              ),
              const Spacer(flex: 2),
              if (!Responsive.isLargeMobile(context))
                const NavigationButtonList().animate().fadeIn(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 200),
                    ),
              const Spacer(flex: 2),
              const ConnectButton().animate().fadeIn(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 400),
                  ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      padding: const EdgeInsets.all(spacingXS),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiusMD),
        gradient: glowGradient,
        boxShadow: [
          BoxShadow(
            color: accentPink.withValues(alpha: 0.3),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(spacingXS),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radiusSM),
        ),
        child: Image.asset(
          'assets/images/triange_icon.png',
          height: 35,
          width: 35,
        ),
      ),
    );
  }
}
