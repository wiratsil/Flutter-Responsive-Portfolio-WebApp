import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          _buildHeaderSection(context),

          const SizedBox(height: spacingXXL),

          // Professional Summary
          _buildGlassCard(
            context,
            icon: FontAwesomeIcons.userTie,
            title: 'PROFESSIONAL SUMMARY',
            delay: 200,
            child: const Text(
              'Experienced Flutter and Unity Developer with over 6 years of experience in mobile app and game development. Proficient in creating and optimizing 2D/3D games using Unity, and developing cross-platform mobile applications using Flutter. Demonstrated ability to deliver high-quality products with several apps and games successfully published on Google Play and the App Store. Skilled in collaborating with teams to create seamless and engaging user experiences.',
              style: TextStyle(
                color: bodyTextColor,
                height: 1.6,
                fontSize: 15,
              ),
            ),
          ),

          const SizedBox(height: spacingLG),

          // Skills Section
          _buildGlassCard(
            context,
            icon: FontAwesomeIcons.code,
            title: 'SKILLS',
            delay: 400,
            child: Column(
              children: [
                _buildSkillRow(
                    context,
                    'Programming Languages',
                    'C#, Dart, Java, Node.js, SQL, C++, HTML, CSS, Go',
                    [accentPink, accentPurple]),
                const SizedBox(height: spacingMD),
                _buildSkillRow(
                    context,
                    'Frameworks & Libraries',
                    'Flutter, AR Foundation, Photon Network, React Native, MongoDB',
                    [accentBlue, accentCyan]),
                const SizedBox(height: spacingMD),
                _buildSkillRow(
                    context,
                    'Tools',
                    'Unity, Android Studio, Xcode, Visual Studio, GitHub, Sourcetree',
                    [accentPurple, accentPink]),
                const SizedBox(height: spacingMD),
                _buildSkillRow(
                    context,
                    'Languages',
                    'Thai (Native), English (Beginner)',
                    [accentCyan, accentBlue]),
              ],
            ),
          ),

          const SizedBox(height: spacingLG),

          // Experience Section
          _buildGlassCard(
            context,
            icon: FontAwesomeIcons.briefcase,
            title: 'EXPERIENCE',
            delay: 600,
            child: Column(
              children: [
                _buildExperienceItem(
                  context,
                  'Digitopolis',
                  'Unity & Flutter Developer',
                  'Dec 2020 – Aug 2024',
                  [
                    'Developed mobile applications and games using Flutter and Unity',
                    'Designed user interfaces and core gameplay mechanics',
                    'Integrated RESTful APIs for backend communication',
                    'Implemented augmented reality (AR) features',
                  ],
                ),
                const SizedBox(height: spacingMD),
                _buildExperienceItem(
                  context,
                  'Atapy',
                  'Unity & React Native Developer',
                  'Mar 2019 – Nov 2020',
                  [
                    'Developed various games using Unity',
                    'Collaborated with design teams on gameplay features',
                  ],
                ),
                const SizedBox(height: spacingMD),
                _buildExperienceItem(
                  context,
                  'Sanuk Games',
                  'Unity Developer',
                  'May 2018 – Feb 2019',
                  [
                    'Integrated equipment features into Pro Fishing Simulator',
                    'Developed merge colliders tools for 3D game objects',
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: spacingLG),

          // Education Section
          _buildGlassCard(
            context,
            icon: FontAwesomeIcons.graduationCap,
            title: 'EDUCATION',
            delay: 800,
            child: Column(
              children: [
                _buildEducationItem(
                  context,
                  'Dhurakij Pundit University',
                  'B.Eng in Digital Media and Game System',
                  '2014 - 2018',
                ),
                const SizedBox(height: spacingMD),
                _buildEducationItem(
                  context,
                  'Benchamabophit School',
                  'Senior High School',
                  '2011 - 2013',
                ),
              ],
            ),
          ),

          const SizedBox(height: spacingXXL),

          // Links Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLinkButton(
                context,
                'Portfolio',
                FontAwesomeIcons.globe,
                'https://wimutti-portfolio.netlify.app/',
              ),
              const SizedBox(width: spacingMD),
              _buildLinkButton(
                context,
                'GitHub',
                FontAwesomeIcons.github,
                'https://github.com/wiratsil',
              ),
            ],
          )
              .animate()
              .fade(delay: const Duration(milliseconds: 1000))
              .slideY(begin: 0.3),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => premiumGradient.createShader(bounds),
          child: Text(
            'WIMUTTI WIRATSIL',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 45.0,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
          ),
        ).animate().fade(duration: animationMedium).slideX(begin: -0.3).shimmer(
            duration: const Duration(seconds: 2), color: Colors.white24),
        const SizedBox(height: spacingSM),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: spacingMD,
            vertical: spacingSM,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                accentPink.withValues(alpha: 0.2),
                accentBlue.withValues(alpha: 0.2),
              ],
            ),
            borderRadius: BorderRadius.circular(radiusMD),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: Text(
            'FLUTTER AND UNITY DEVELOPER',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white70,
                  letterSpacing: 2,
                ),
          ),
        )
            .animate()
            .fade(delay: const Duration(milliseconds: 200))
            .slideX(begin: -0.3),
      ],
    );
  }

  Widget _buildGlassCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Widget child,
    int delay = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radiusLG),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(spacingLG),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(radiusLG),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.05),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(spacingSM),
                    decoration: BoxDecoration(
                      gradient: glowGradient,
                      borderRadius: BorderRadius.circular(radiusSM),
                    ),
                    child: Icon(icon, color: Colors.white, size: 18),
                  ),
                  const SizedBox(width: spacingMD),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: spacingLG),
              child,
            ],
          ),
        ),
      ),
    )
        .animate()
        .fade(delay: Duration(milliseconds: delay), duration: animationMedium)
        .slideX(begin: -0.2);
  }

  Widget _buildSkillRow(BuildContext context, String category, String skills,
      List<Color> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 20,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: colors),
                borderRadius: BorderRadius.circular(radiusXS),
              ),
            ),
            const SizedBox(width: spacingSM),
            Text(
              category,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: spacingMD + 4),
          child: Text(
            skills,
            style: const TextStyle(color: bodyTextColor, height: 1.5),
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceItem(
    BuildContext context,
    String company,
    String role,
    String date,
    List<String> responsibilities,
  ) {
    return Container(
      padding: const EdgeInsets.all(spacingMD),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(radiusMD),
        border: Border.all(color: Colors.white.withValues(alpha: 0.03)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    role,
                    style: TextStyle(
                      color: accentPink.withValues(alpha: 0.8),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: spacingSM,
                  vertical: spacingXS,
                ),
                decoration: BoxDecoration(
                  color: accentBlue.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(radiusSM),
                ),
                child: Text(
                  date,
                  style: const TextStyle(
                    color: accentCyan,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: spacingSM),
          ...responsibilities.map((resp) => Padding(
                padding: const EdgeInsets.only(bottom: spacingXS),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        gradient: glowGradient,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: spacingSM),
                    Expanded(
                      child: Text(
                        resp,
                        style: const TextStyle(
                          color: bodyTextColor,
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildEducationItem(
    BuildContext context,
    String school,
    String degree,
    String year,
  ) {
    return Container(
      padding: const EdgeInsets.all(spacingMD),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(radiusMD),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: premiumGradient,
              borderRadius: BorderRadius.circular(radiusMD),
            ),
            child: const Icon(
              FontAwesomeIcons.buildingColumns,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: spacingMD),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  school,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                Text(
                  degree,
                  style: const TextStyle(color: bodyTextColor, fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: spacingSM,
              vertical: spacingXS,
            ),
            decoration: BoxDecoration(
              color: accentPurple.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(radiusSM),
            ),
            child: Text(
              year,
              style: TextStyle(
                color: accentPurple.withValues(alpha: 0.8),
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkButton(
    BuildContext context,
    String label,
    IconData icon,
    String url,
  ) {
    return _HoverLinkButton(
      label: label,
      icon: icon,
      onTap: () => launchUrl(Uri.parse(url)),
    );
  }
}

class _HoverLinkButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _HoverLinkButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_HoverLinkButton> createState() => _HoverLinkButtonState();
}

class _HoverLinkButtonState extends State<_HoverLinkButton> {
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
          padding: const EdgeInsets.symmetric(
            horizontal: spacingLG,
            vertical: spacingMD,
          ),
          decoration: BoxDecoration(
            gradient: _isHovered ? glowGradient : null,
            color: _isHovered ? null : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(radiusLG),
            border: Border.all(
              color: _isHovered
                  ? Colors.transparent
                  : Colors.white.withValues(alpha: 0.1),
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: accentPink.withValues(alpha: 0.3),
                      blurRadius: 20,
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: spacingSM),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const double radiusXS = 4.0;
