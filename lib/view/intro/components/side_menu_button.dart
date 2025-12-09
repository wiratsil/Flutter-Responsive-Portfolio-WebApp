import 'package:flutter/material.dart';
import '../../../res/constants.dart';

class MenuButton extends StatefulWidget {
  final VoidCallback onTap;

  const MenuButton({super.key, required this.onTap});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: animationFast,
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
        child: AnimatedContainer(
          duration: animationMedium,
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(spacingSM),
          decoration: BoxDecoration(
            color: _isHovered
                ? accentPink.withValues(alpha: 0.15)
                : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(radiusMD),
            border: Border.all(
              color: _isHovered
                  ? accentPink.withValues(alpha: 0.5)
                  : Colors.white.withValues(alpha: 0.1),
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: accentPink.withValues(alpha: 0.3),
                      blurRadius: 15,
                      spreadRadius: -3,
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLine(0),
              const SizedBox(height: 5),
              _buildLine(1),
              const SizedBox(height: 5),
              _buildLine(2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLine(int index) {
    final widths = [24.0, 18.0, 24.0];
    final offsets = [0.0, 6.0, 0.0];

    return AnimatedContainer(
      duration: animationMedium,
      height: 3,
      width: _isHovered ? 24 : widths[index],
      margin: EdgeInsets.only(
        left: _isHovered ? 0 : offsets[index],
      ),
      decoration: BoxDecoration(
        gradient: _isHovered ? glowGradient : null,
        color: _isHovered ? null : Colors.white70,
        borderRadius: BorderRadius.circular(radiusSM),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: accentPink.withValues(alpha: 0.5),
                  blurRadius: 5,
                ),
              ]
            : null,
      ),
    );
  }
}
