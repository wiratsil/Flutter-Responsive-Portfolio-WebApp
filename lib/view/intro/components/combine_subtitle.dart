import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/subtitle_text.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class CombineSubtitleText extends StatelessWidget {
  const CombineSubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Responsive(
          desktop: AnimatedSubtitleText(
            start: 30,
            end: 40,
            text: 'Flutter & Unity ',
          ),
          largeMobile: AnimatedSubtitleText(
            start: 30,
            end: 25,
            text: 'Flutter & Unity ',
          ),
          mobile: AnimatedSubtitleText(
            start: 25,
            end: 20,
            text: 'Flutter & Unity ',
          ),
          tablet: AnimatedSubtitleText(
            start: 40,
            end: 30,
            text: 'Flutter & Unity ',
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                accentPink,
                accentPurple,
                accentBlue,
              ],
            ).createShader(bounds);
          },
          child: Responsive(
            desktop: _buildDeveloperText(40),
            largeMobile: _buildDeveloperText(25),
            mobile: _buildDeveloperText(20),
            tablet: _buildDeveloperText(30),
          ),
        ),
      ],
    );
  }

  Widget _buildDeveloperText(double fontSize) {
    return Text(
      'Developer',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 1,
      ),
    );
  }
}
