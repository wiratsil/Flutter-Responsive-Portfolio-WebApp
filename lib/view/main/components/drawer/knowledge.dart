import 'package:flutter/material.dart';
import '../../../../res/constants.dart';

class KnowledgeText extends StatelessWidget {
  const KnowledgeText({super.key, required this.knowledge});
  final String knowledge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: spacingSM),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              gradient: glowGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: accentPink.withValues(alpha: 0.5),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(width: spacingSM),
          Expanded(
            child: Text(
              knowledge,
              style: const TextStyle(
                color: bodyTextColor,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
