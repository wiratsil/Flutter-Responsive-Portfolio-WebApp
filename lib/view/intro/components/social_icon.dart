import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../res/constants.dart';

class SocialMediaIcon extends StatefulWidget {
  final String icon;
  final VoidCallback? onTap;
  final Color hoverColor;

  const SocialMediaIcon({
    super.key,
    required this.icon,
    this.onTap,
    this.hoverColor = accentPink,
  });

  @override
  State<SocialMediaIcon> createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<SocialMediaIcon>
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
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
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
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: AnimatedContainer(
                duration: animationMedium,
                height: 40,
                width: 40,
                margin: const EdgeInsets.symmetric(vertical: spacingXS),
                padding: const EdgeInsets.all(spacingSM),
                decoration: BoxDecoration(
                  color: _isHovered
                      ? widget.hoverColor.withValues(alpha: 0.15)
                      : Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(radiusMD),
                  border: Border.all(
                    color: _isHovered
                        ? widget.hoverColor.withValues(alpha: 0.5)
                        : Colors.white.withValues(alpha: 0.1),
                  ),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: widget.hoverColor.withValues(alpha: 0.3),
                            blurRadius: 15,
                            spreadRadius: -3,
                          ),
                        ]
                      : null,
                ),
                child: SvgPicture.asset(
                  widget.icon,
                  colorFilter: ColorFilter.mode(
                    _isHovered ? widget.hoverColor : Colors.white70,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
