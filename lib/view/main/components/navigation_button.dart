import 'package:flutter/material.dart';
import '../../../res/constants.dart';

class NavigationTextButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final IconData? icon;

  const NavigationTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.icon,
  });

  @override
  State<NavigationTextButton> createState() => _NavigationTextButtonState();
}

class _NavigationTextButtonState extends State<NavigationTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: animationFast,
          margin: const EdgeInsets.symmetric(horizontal: spacingXS),
          padding: const EdgeInsets.symmetric(
            horizontal: spacingMD,
            vertical: spacingSM,
          ),
          decoration: BoxDecoration(
            color: _isHovered
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(radiusMD),
            border: Border.all(
              color: _isHovered
                  ? accentPink.withValues(alpha: 0.3)
                  : Colors.transparent,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                AnimatedContainer(
                  duration: animationFast,
                  child: Icon(
                    widget.icon,
                    size: 16,
                    color: _isHovered ? accentPink : bodyTextColor,
                  ),
                ),
                const SizedBox(width: spacingXS),
              ],
              AnimatedDefaultTextStyle(
                duration: animationFast,
                style: TextStyle(
                  color: _isHovered ? Colors.white : bodyTextColor,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
                child: Text(widget.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
