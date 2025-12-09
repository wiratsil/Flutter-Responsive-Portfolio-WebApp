import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../res/constants.dart';
import 'header_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: spacingSM),
        _buildInfoRow(
          FontAwesomeIcons.phone,
          'Contact',
          '+66 XX-XXX-XXXX',
          accentCyan,
        ),
        _buildInfoRow(
          FontAwesomeIcons.envelope,
          'Email',
          'wimutti@example.com',
          accentPink,
        ),
        _buildInfoRow(
          FontAwesomeIcons.linkedin,
          'LinkedIn',
          '@wimutti-wiratsil',
          Color(0xFF0A66C2),
        ),
        _buildInfoRow(
          FontAwesomeIcons.github,
          'Github',
          '@wiratsil',
          Colors.white70,
        ),
        const SizedBox(height: spacingMD),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacingXS),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(radiusSM),
            ),
            child: Icon(icon, color: color, size: 14),
          ),
          const SizedBox(width: spacingSM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
