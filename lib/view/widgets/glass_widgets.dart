import 'dart:ui';
import 'package:flutter/material.dart';
import '../../res/constants.dart';

/// Glassmorphism container widget for premium glass effect
class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final double blur;
  final Color? backgroundColor;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;
  final bool showGlow;
  final Color glowColor;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius = radiusLG,
    this.blur = 10,
    this.backgroundColor,
    this.borderColor,
    this.boxShadow,
    this.showGlow = false,
    this.glowColor = accentPink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor ?? glassColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: borderColor ?? glassBorderColor,
                width: 1,
              ),
              boxShadow: showGlow
                  ? [
                      BoxShadow(
                        color: glowColor.withValues(alpha: 0.2),
                        blurRadius: 20,
                        spreadRadius: -5,
                      ),
                    ]
                  : boxShadow,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Animated glass button with hover effects
class GlassButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final IconData? icon;
  final double? width;
  final double? height;
  final bool isLoading;
  final Gradient? gradient;

  const GlassButton({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
    this.width,
    this.height = 50,
    this.isLoading = false,
    this.gradient,
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: animationFast,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() => _isHovered = isHovered);
    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: GestureDetector(
              onTap: widget.isLoading ? null : widget.onTap,
              child: AnimatedContainer(
                duration: animationMedium,
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  gradient: widget.gradient ?? glowGradient,
                  borderRadius: BorderRadius.circular(radiusXL),
                  boxShadow: [
                    BoxShadow(
                      color:
                          accentPink.withValues(alpha: _isHovered ? 0.5 : 0.3),
                      blurRadius: _isHovered ? 25 : 15,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color:
                          accentBlue.withValues(alpha: _isHovered ? 0.3 : 0.2),
                      blurRadius: _isHovered ? 25 : 15,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: spacingLG,
                    vertical: spacingSM,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.isLoading)
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      else ...[
                        Text(
                          widget.text,
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                        ),
                        if (widget.icon != null) ...[
                          const SizedBox(width: spacingSM),
                          Icon(
                            widget.icon,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Gradient text widget
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient? gradient;

  const GradientText({
    super.key,
    required this.text,
    this.style,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return (gradient ?? glowGradient).createShader(bounds);
      },
      child: Text(
        text,
        style: (style ?? Theme.of(context).textTheme.headlineLarge)?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

/// Animated gradient border container
class GradientBorderContainer extends StatefulWidget {
  final Widget child;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const GradientBorderContainer({
    super.key,
    required this.child,
    this.borderWidth = 2,
    this.borderRadius = radiusLG,
    this.padding,
    this.margin,
  });

  @override
  State<GradientBorderContainer> createState() =>
      _GradientBorderContainerState();
}

class _GradientBorderContainerState extends State<GradientBorderContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          margin: widget.margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: SweepGradient(
              colors: const [
                accentPink,
                accentPurple,
                accentBlue,
                accentCyan,
                accentPink,
              ],
              transform: GradientRotation(_controller.value * 6.28),
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(widget.borderWidth),
            padding: widget.padding,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(
                widget.borderRadius - widget.borderWidth,
              ),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}

/// Glow effect wrapper
class GlowWrapper extends StatelessWidget {
  final Widget child;
  final Color glowColor;
  final double blurRadius;

  const GlowWrapper({
    super.key,
    required this.child,
    this.glowColor = accentPink,
    this.blurRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: glowColor.withValues(alpha: 0.3),
            blurRadius: blurRadius,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
