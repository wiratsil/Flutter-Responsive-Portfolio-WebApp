import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../res/constants.dart';

/// Premium animated background with floating particles and gradient
class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final int particleCount;

  const AnimatedBackground({
    super.key,
    required this.child,
    this.particleCount = 30,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> particles;
  final math.Random random = math.Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    particles = List.generate(
      widget.particleCount,
      (_) => Particle(random),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0A0A0F),
                Color(0xFF0D0D15),
                Color(0xFF0A0A0F),
              ],
            ),
          ),
        ),
        // Animated particles
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              size: MediaQuery.of(context).size,
              painter: ParticlePainter(
                particles: particles,
                animation: _controller.value,
              ),
            );
          },
        ),
        // Grid overlay for tech feel
        Opacity(
          opacity: 0.03,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const NetworkImage(
                  'data:image/svg+xml,%3Csvg%20width%3D%2260%22%20height%3D%2260%22%20viewBox%3D%220%200%2060%2060%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%3Cpath%20d%3D%22M0%200h60v60H0V0zm1%201h58v58H1V1z%22%20fill%3D%22%23ffffff%22%20fill-opacity%3D%220.4%22%2F%3E%3C%2Fsvg%3E',
                ),
                repeat: ImageRepeat.repeat,
                opacity: 0.5,
              ),
            ),
          ),
        ),
        // Glow orbs
        ..._buildGlowOrbs(context),
        // Content
        widget.child,
      ],
    );
  }

  List<Widget> _buildGlowOrbs(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return [
      // Top-right pink orb
      Positioned(
        top: -size.height * 0.2,
        right: -size.width * 0.1,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                math.sin(_controller.value * math.pi * 2) * 30,
                math.cos(_controller.value * math.pi * 2) * 20,
              ),
              child: Container(
                width: size.width * 0.5,
                height: size.width * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      accentPink.withValues(alpha: 0.15),
                      accentPink.withValues(alpha: 0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // Bottom-left blue orb
      Positioned(
        bottom: -size.height * 0.15,
        left: -size.width * 0.15,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                math.cos(_controller.value * math.pi * 2) * 25,
                math.sin(_controller.value * math.pi * 2) * 35,
              ),
              child: Container(
                width: size.width * 0.6,
                height: size.width * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      accentBlue.withValues(alpha: 0.12),
                      accentBlue.withValues(alpha: 0.04),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // Center purple orb
      Positioned(
        top: size.height * 0.3,
        left: size.width * 0.3,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                math.sin(_controller.value * math.pi * 2 + 1) * 40,
                math.cos(_controller.value * math.pi * 2 + 1) * 30,
              ),
              child: Container(
                width: size.width * 0.4,
                height: size.width * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      accentPurple.withValues(alpha: 0.08),
                      accentPurple.withValues(alpha: 0.02),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ];
  }
}

class Particle {
  late double x;
  late double y;
  late double size;
  late double speedX;
  late double speedY;
  late Color color;
  late double opacity;

  Particle(math.Random random) {
    x = random.nextDouble();
    y = random.nextDouble();
    size = random.nextDouble() * 3 + 1;
    speedX = (random.nextDouble() - 0.5) * 0.02;
    speedY = (random.nextDouble() - 0.5) * 0.02;
    opacity = random.nextDouble() * 0.5 + 0.1;

    final colors = [accentPink, accentBlue, accentPurple, accentCyan];
    color = colors[random.nextInt(colors.length)];
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animation;

  ParticlePainter({required this.particles, required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      final x =
          ((particle.x + particle.speedX * animation * 50) % 1) * size.width;
      final y =
          ((particle.y + particle.speedY * animation * 50) % 1) * size.height;

      final paint = Paint()
        ..color = particle.color.withValues(alpha: particle.opacity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

      canvas.drawCircle(Offset(x, y), particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant ParticlePainter oldDelegate) => true;
}
