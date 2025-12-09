import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/home/home.dart';
import 'package:flutter_portfolio/view/widgets/glass_widgets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _particleController;
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  double _loadingProgress = 0.0;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _logoScale = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.elasticOut,
      ),
    );

    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _logoController.forward();
    _startLoading();
  }

  void _startLoading() async {
    // Simulate loading with smooth progress
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 25));
      if (mounted) {
        setState(() {
          _loadingProgress = i / 100;
        });
      }
    }

    // Navigate after loading complete
    if (mounted) {
      await Future.delayed(const Duration(milliseconds: 300));
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          // Animated gradient background
          _buildAnimatedBackground(size),

          // Floating particles
          _buildParticles(size),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo with glow effect
                AnimatedBuilder(
                  animation: _logoController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _logoScale.value,
                      child: Opacity(
                        opacity: _logoOpacity.value,
                        child: _buildLogo(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: spacingXL),

                // Loading bar
                _buildLoadingBar()
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 500))
                    .slideY(begin: 0.5, end: 0),

                const SizedBox(height: spacingMD),

                // Loading text
                _buildLoadingText()
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 700)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedBackground(Size size) {
    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(
                math.sin(_particleController.value * math.pi * 2) * 0.3,
                math.cos(_particleController.value * math.pi * 2) * 0.3,
              ),
              radius: 1.5,
              colors: [
                accentPurple.withValues(alpha: 0.1),
                bgColor,
                bgColor,
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildParticles(Size size) {
    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        return CustomPaint(
          size: size,
          painter: SplashParticlePainter(
            animation: _particleController.value,
          ),
        );
      },
    );
  }

  Widget _buildLogo() {
    return GradientBorderContainer(
      borderRadius: radiusXXL,
      borderWidth: 3,
      padding: const EdgeInsets.all(spacingLG),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radiusXL),
          boxShadow: [
            BoxShadow(
              color: accentPink.withValues(alpha: 0.3),
              blurRadius: 30,
              spreadRadius: -5,
            ),
            BoxShadow(
              color: accentBlue.withValues(alpha: 0.3),
              blurRadius: 30,
              spreadRadius: -5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radiusXL),
          child: Image.asset(
            'assets/images/image.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingBar() {
    return Column(
      children: [
        Container(
          width: 250,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(radiusMD),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                width: 250 * _loadingProgress,
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
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingText() {
    return ShaderMask(
      shaderCallback: (bounds) => glowGradient.createShader(bounds),
      child: Text(
        '${(_loadingProgress * 100).toInt()}%',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 2,
        ),
      ),
    );
  }
}

class SplashParticlePainter extends CustomPainter {
  final double animation;
  final math.Random random = math.Random(42);

  SplashParticlePainter({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final particleCount = 50;

    for (int i = 0; i < particleCount; i++) {
      final baseX = random.nextDouble();
      final baseY = random.nextDouble();
      final particleSize = random.nextDouble() * 2 + 0.5;
      final speed = random.nextDouble() * 0.5 + 0.5;

      final x = ((baseX + animation * speed) % 1) * size.width;
      final y = ((baseY + animation * speed * 0.5) % 1) * size.height;

      final colors = [accentPink, accentBlue, accentPurple, accentCyan];
      final color = colors[i % colors.length];

      final paint = Paint()
        ..color = color.withValues(alpha: 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

      canvas.drawCircle(Offset(x, y), particleSize, paint);
    }
  }

  @override
  bool shouldRepaint(covariant SplashParticlePainter oldDelegate) => true;
}
