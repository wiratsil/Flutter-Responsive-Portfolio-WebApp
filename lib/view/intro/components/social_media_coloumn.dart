import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio/view/intro/components/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaIcon(
          icon: 'assets/icons/linkedin.svg',
          onTap: () => launchUrl(
              Uri.parse('https://www.linkedin.com/in/wimutti-wiratsil/')),
          hoverColor: const Color(0xFF0A66C2),
        ),
        SocialMediaIcon(
          icon: 'assets/icons/github.svg',
          onTap: () => launchUrl(Uri.parse('https://github.com/wiratsil')),
          hoverColor: Colors.white,
        ),
        const SocialMediaIcon(
          icon: 'assets/icons/dribble.svg',
          hoverColor: Color(0xFFEA4C89),
        ),
        const SocialMediaIcon(
          icon: 'assets/icons/twitter.svg',
          hoverColor: Color(0xFF1DA1F2),
        ),
      ]
          .animate(interval: const Duration(milliseconds: 150))
          .fade(duration: const Duration(milliseconds: 400))
          .slide(begin: const Offset(0, 0.5)),
    );
  }
}
