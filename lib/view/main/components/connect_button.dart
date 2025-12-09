import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class ConnectButton extends StatefulWidget {
  const ConnectButton({super.key});

  @override
  State<ConnectButton> createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton>
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
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: InkWell(
                onTap: () {
                  launchUrl(Uri.parse('https://wa.me/03054200605'));
                },
                borderRadius: BorderRadius.circular(radiusXL),
                child: AnimatedContainer(
                  duration: animationMedium,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: spacingLG),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radiusXL),
                    gradient: glowGradient,
                    boxShadow: [
                      BoxShadow(
                        color: accentPink.withValues(
                            alpha: _isHovered ? 0.6 : 0.3),
                        blurRadius: _isHovered ? 25 : 15,
                        offset: const Offset(0, 4),
                      ),
                      BoxShadow(
                        color: accentBlue.withValues(
                            alpha: _isHovered ? 0.4 : 0.2),
                        blurRadius: _isHovered ? 25 : 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Color(0xFF25D366),
                        size: 16,
                      ),
                      const SizedBox(width: spacingSM),
                      Text(
                        'Connect',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.white,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                      ),
                    ],
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
