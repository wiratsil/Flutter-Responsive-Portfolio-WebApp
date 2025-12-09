import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton>
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
            child: InkWell(
              onTap: () {
                launchUrl(Uri.parse(
                    'https://drive.google.com/file/d/1HSIe7rdk8VtrAL4DQuybfMHQgDrQ6xNs/view?usp=sharing'));
              },
              borderRadius: BorderRadius.circular(radiusXL),
              child: AnimatedContainer(
                duration: animationMedium,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  vertical: spacingMD,
                  horizontal: spacingXL,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radiusXL),
                  gradient: glowGradient,
                  boxShadow: [
                    BoxShadow(
                      color:
                          accentPink.withValues(alpha: _isHovered ? 0.6 : 0.3),
                      blurRadius: _isHovered ? 30 : 15,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color:
                          accentBlue.withValues(alpha: _isHovered ? 0.4 : 0.2),
                      blurRadius: _isHovered ? 30 : 15,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Download CV',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.white,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(width: spacingSM),
                    AnimatedContainer(
                      duration: animationMedium,
                      transform: Matrix4.translationValues(
                        0,
                        _isHovered ? 2 : 0,
                        0,
                      ),
                      child: const Icon(
                        FontAwesomeIcons.download,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
