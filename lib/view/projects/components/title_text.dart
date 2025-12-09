import 'package:flutter/material.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.prefix, required this.title});

  final String prefix;
  final String title;

  @override
  Widget build(BuildContext context) {
    final fontSize = !Responsive.isDesktop(context)
        ? Responsive.isLargeMobile(context)
            ? 24.0
            : 35.0
        : 55.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$prefix ',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
        ),
        ShaderMask(
          shaderCallback: (bounds) {
            return premiumGradient.createShader(bounds);
          },
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
          ),
        ),
        // Decorative line
        const SizedBox(width: spacingMD),
        Container(
          width: Responsive.isLargeMobile(context) ? 30 : 60,
          height: 4,
          decoration: BoxDecoration(
            gradient: glowGradient,
            borderRadius: BorderRadius.circular(radiusSM),
            boxShadow: [
              BoxShadow(
                color: accentPink.withValues(alpha: 0.5),
                blurRadius: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
