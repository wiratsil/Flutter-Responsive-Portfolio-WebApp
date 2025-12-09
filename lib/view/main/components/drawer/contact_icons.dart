import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../res/constants.dart';

class ContactIcon extends StatelessWidget {
  const ContactIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: spacingSM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SocialIconButton(
            icon: 'assets/icons/linkedin.svg',
            hoverColor: const Color(0xFF0A66C2),
            onTap: () => launchUrl(
                Uri.parse('https://linkedin.com/in/wimutti-wiratsil')),
          ),
          const SizedBox(width: spacingSM),
          _SocialIconButton(
            icon: 'assets/icons/github.svg',
            hoverColor: Colors.white,
            onTap: () => launchUrl(Uri.parse('https://github.com/wiratsil')),
          ),
          const SizedBox(width: spacingSM),
          _SocialIconButton(
            icon: 'assets/icons/twitter.svg',
            hoverColor: const Color(0xFF1DA1F2),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final String icon;
  final Color hoverColor;
  final VoidCallback onTap;

  const _SocialIconButton({
    required this.icon,
    required this.hoverColor,
    required this.onTap,
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
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: animationFast,
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
                      blurRadius: 10,
                    ),
                  ]
                : null,
          ),
          child: SvgPicture.asset(
            widget.icon,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              _isHovered ? widget.hoverColor : Colors.white70,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
