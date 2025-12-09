import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../res/constants.dart';

class MySKills extends StatelessWidget {
  const MySKills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Flutter Skills Section
        _buildSkillCategory(
          context,
          'Flutter Development',
          FontAwesomeIcons.flutter,
          const Color(0xFF02569B),
          ['Flutter', 'Dart', 'GetX', 'Bloc', 'Firebase', 'REST APIs'],
        ),

        const SizedBox(height: spacingMD),

        // Unity Skills Section
        _buildSkillCategory(
          context,
          'Unity Development',
          FontAwesomeIcons.unity,
          accentPurple,
          ['Unity', 'C#', '2D/3D Games', 'AR Foundation', 'Photon'],
        ),

        const SizedBox(height: spacingMD),

        // Other Skills
        _buildSkillCategory(
          context,
          'Other',
          FontAwesomeIcons.code,
          accentCyan,
          ['Git', 'SQL', 'Node.js', 'React Native'],
        ),
      ],
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    List<String> skills,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Header
        Row(
          children: [
            Icon(icon, color: color, size: 14),
            const SizedBox(width: spacingXS),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: spacingSM),
        // Skill Chips
        Wrap(
          spacing: spacingXS,
          runSpacing: spacingXS,
          children:
              skills.map((skill) => _buildSkillChip(skill, color)).toList(),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingSM,
        vertical: spacingXS,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(radiusSM),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color.withValues(alpha: 0.9),
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
