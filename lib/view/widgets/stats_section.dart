import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../res/constants.dart';

/// Stats Counter with animated counting effect
class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: spacingLG),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStatItem('6+', 'Years\nExperience', accentPink, 0),
          _buildDivider(),
          _buildStatItem('20+', 'Projects\nCompleted', accentBlue, 100),
          _buildDivider(),
          _buildStatItem('10+', 'Apps\nPublished', accentPurple, 200),
          _buildDivider(),
          _buildStatItem('15+', 'Games\nDeveloped', accentCyan, 300),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, Color color, int delay) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacingLG),
      child: Column(
        children: [
          _AnimatedCounter(
            value: value,
            color: color,
          ),
          const SizedBox(height: spacingXS),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: bodyTextColor.withValues(alpha: 0.8),
              fontSize: 12,
              height: 1.3,
            ),
          ),
        ],
      ),
    )
        .animate()
        .fade(delay: Duration(milliseconds: delay), duration: animationMedium)
        .slideY(begin: 0.3);
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.white.withValues(alpha: 0.2),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}

class _AnimatedCounter extends StatefulWidget {
  final String value;
  final Color color;

  const _AnimatedCounter({required this.value, required this.color});

  @override
  State<_AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<_AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    final numericValue = int.tryParse(widget.value.replaceAll('+', '')) ?? 0;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _animation = Tween<double>(
      begin: 0,
      end: numericValue.toDouble(),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [widget.color, widget.color.withValues(alpha: 0.7)],
          ).createShader(bounds),
          child: Text(
            '${_animation.value.toInt()}+',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
