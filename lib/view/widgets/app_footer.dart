import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../res/constants.dart';

/// Footer with copyright and made with Flutter
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingLG,
        vertical: spacingMD,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.02),
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ' ${DateTime.now().year} Wimutti Wiratsil. All rights reserved.',
            style: TextStyle(
              color: bodyTextColor.withValues(alpha: 0.6),
              fontSize: 12,
            ),
          ),
          const SizedBox(width: spacingLG),
          Container(
            width: 1,
            height: 16,
            color: Colors.white.withValues(alpha: 0.1),
          ),
          const SizedBox(width: spacingLG),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Made with ',
                style: TextStyle(
                  color: bodyTextColor.withValues(alpha: 0.6),
                  fontSize: 12,
                ),
              ),
              const Icon(
                FontAwesomeIcons.flutter,
                size: 14,
                color: Color(0xFF02569B),
              ),
              Text(
                ' Flutter',
                style: TextStyle(
                  color: bodyTextColor.withValues(alpha: 0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
