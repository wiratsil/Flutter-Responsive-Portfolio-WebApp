import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../res/constants.dart';

/// Floating social links on the side
class FloatingSocialLinks extends StatelessWidget {
  const FloatingSocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingSM,
        vertical: spacingMD,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(radiusXL),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SocialIconButton(
            icon: 'assets/icons/linkedin.svg',
            hoverColor: const Color(0xFF0A66C2),
            url: 'https://linkedin.com/in/wimutti-wiratsil',
          ),
          const SizedBox(height: spacingSM),
          _SocialIconButton(
            icon: 'assets/icons/github.svg',
            hoverColor: Colors.white,
            url: 'https://github.com/wiratsil',
          ),
          const SizedBox(height: spacingSM),
          _SocialIconButton(
            icon: 'assets/icons/twitter.svg',
            hoverColor: const Color(0xFF1DA1F2),
            url: 'https://twitter.com',
          ),
        ],
      ),
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final String icon;
  final Color hoverColor;
  final String url;

  const _SocialIconButton({
    required this.icon,
    required this.hoverColor,
    required this.url,
  });

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: animationFast,
          padding: const EdgeInsets.all(spacingSM),
          decoration: BoxDecoration(
            color: _isHovered
                ? widget.hoverColor.withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(radiusMD),
          ),
          child: SvgPicture.asset(
            widget.icon,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              _isHovered
                  ? widget.hoverColor
                  : Colors.white.withValues(alpha: 0.6),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
