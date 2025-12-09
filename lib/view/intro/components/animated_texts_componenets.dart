import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer(
      {super.key, this.height = 350, this.width = 280});
  final double? width;
  final double? height;

  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}

class AnimatedImageContainerState extends State<AnimatedImageContainer>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _floatController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_floatController, _glowController]),
      builder: (context, child) {
        final floatValue = _floatController.value;
        final glowValue = _glowController.value;

        return Transform.translate(
          offset: Offset(0, 8 * math.sin(floatValue * math.pi)),
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radiusXXL),
              gradient: SweepGradient(
                colors: const [
                  accentPink,
                  accentPurple,
                  accentBlue,
                  accentCyan,
                  accentPink,
                ],
                transform: GradientRotation(glowValue * 2 * math.pi),
              ),
              boxShadow: [
                BoxShadow(
                  color: accentPink.withValues(alpha: 0.4),
                  offset: const Offset(-5, 0),
                  blurRadius: 30,
                ),
                BoxShadow(
                  color: accentBlue.withValues(alpha: 0.4),
                  offset: const Offset(5, 0),
                  blurRadius: 30,
                ),
                BoxShadow(
                  color: accentPurple.withValues(alpha: 0.2),
                  offset: const Offset(0, 10),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(radiusXXL - 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radiusXXL - 4),
                child: Image.asset(
                  'assets/images/profile.png',
                  height: Responsive.isLargeMobile(context)
                      ? MediaQuery.sizeOf(context).width * 0.25
                      : Responsive.isTablet(context)
                          ? MediaQuery.sizeOf(context).width * 0.16
                          : 250,
                  width: Responsive.isLargeMobile(context)
                      ? MediaQuery.sizeOf(context).width * 0.25
                      : Responsive.isTablet(context)
                          ? MediaQuery.sizeOf(context).width * 0.16
                          : 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
