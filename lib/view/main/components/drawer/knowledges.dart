import 'package:flutter/material.dart';
import '../../../../res/constants.dart';
import 'knowledge.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.white.withValues(alpha: 0.1)),
        const SizedBox(height: spacingSM),
        Row(
          children: [
            Container(
              width: 4,
              height: 20,
              decoration: BoxDecoration(
                gradient: glowGradient,
                borderRadius: BorderRadius.circular(radiusSM),
              ),
            ),
            const SizedBox(width: spacingSM),
            Text(
              'Knowledge',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
            ),
          ],
        ),
        const SizedBox(height: spacingMD),
        const KnowledgeText(knowledge: 'Flutter, Dart, Unity'),
        const KnowledgeText(knowledge: 'Mobile & Game Development'),
        const KnowledgeText(knowledge: 'AR/VR Development'),
        const KnowledgeText(knowledge: 'Git, GitHub, CI/CD'),
      ],
    );
  }
}
