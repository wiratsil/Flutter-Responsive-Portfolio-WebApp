import 'package:flutter/material.dart';
import '../../../../res/constants.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    super.key,
    required this.percentage,
    required this.title,
    this.image,
  });

  final double percentage;
  final String title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: spacingMD),
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: percentage),
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeOutCubic,
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (image != null)
                    Container(
                      height: 20,
                      width: 20,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(radiusXS),
                      ),
                      child: Image.asset(
                        image!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  const SizedBox(width: spacingSM),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${(value * 100).toInt()}%',
                    style: TextStyle(
                      color: _getProgressColor(value),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: spacingSM),
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(radiusSM),
                ),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: MediaQuery.of(context).size.width * 0.6 * value,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            _getProgressColor(value),
                            _getProgressColor(value).withValues(alpha: 0.7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(radiusSM),
                        boxShadow: [
                          BoxShadow(
                            color:
                                _getProgressColor(value).withValues(alpha: 0.4),
                            blurRadius: 8,
                            spreadRadius: -2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Color _getProgressColor(double value) {
    if (value >= 0.8) return accentCyan;
    if (value >= 0.6) return accentBlue;
    if (value >= 0.4) return accentPurple;
    return accentPink;
  }
}

const double radiusXS = 4.0;

class MySKills extends StatelessWidget {
  const MySKills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Skills'),
        const SizedBox(height: spacingMD),
        const AnimatedLinearProgressIndicator(
          percentage: 0.85,
          title: 'Flutter',
          image: 'assets/icons/flutter.png',
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.9,
          title: 'Dart',
          image: 'assets/icons/dart.png',
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.75,
          title: 'Unity',
          image: 'assets/icons/bloc.png',
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.7,
          title: 'Firebase',
          image: 'assets/icons/firebase.png',
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.85,
          title: 'Clean Architecture',
          image: 'assets/icons/flutter.png',
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.8,
          title: 'GetX & Bloc',
          image: 'assets/icons/bloc.png',
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            gradient: glowGradient,
            borderRadius: BorderRadius.circular(radiusSM),
          ),
        ),
        const SizedBox(width: spacingSM),
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
        ),
      ],
    );
  }
}
