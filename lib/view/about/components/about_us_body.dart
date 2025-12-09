import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:url_launcher/url_launcher.dart';
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
              'Experienced Flutter and Unity Developer with over 6 years of experience in mobile app and game development. Proficient in creating and optimizing 2D/3D games using Unity, and developing cross-platform mobile applications using Flutter. Demonstrated ability to deliver high-quality products with several apps and games successfully published on Google Play and the App Store.',
              style: TextStyle(
                color: bodyTextColor,
                height: 1.7,
                fontSize: 15,
              ),
            ),
          ),

          const SizedBox(height: spacingLG),

          // Skills Section - Clean chip style
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Flutter Skills
              Expanded(
                child: _buildSkillSection(
                  context,
                  'Flutter Development',
                  FontAwesomeIcons.flutter,
                  const Color(0xFF02569B),
                  [
                    'Flutter Framework',
                    'Dart Language',
                    'State Management',
                    'GetX / Bloc / Provider',
                    'Firebase Integration',
                    'RESTful APIs',
                    'Responsive Design',
                    'Clean Architecture',
                  ],
                  delay: 400,
                ),
              ),
              const SizedBox(width: spacingMD),
              // Unity Skills
              Expanded(
                child: _buildSkillSection(
                  context,
                  'Unity Development',
                  FontAwesomeIcons.unity,
                  accentPurple,
                  [
                    'Unity Engine',
                    'C# Programming',
                    '2D/3D Game Dev',
                    'AR Foundation',
                    'Photon Network',
                    'Game Optimization',
                    'UI/UX for Games',
                    'Physics & Animation',
                  ],
                  delay: 500,
                ),
              ),
            ],
          ),

          const SizedBox(height: spacingLG),

          // Other Skills
          _buildGlassCard(
            context,
            icon: FontAwesomeIcons.code,
            title: 'OTHER TECHNOLOGIES',
            delay: 600,
            child: Wrap(
              spacing: spacingSM,
              runSpacing: spacingSM,
              children: [
                _buildSkillChip('React Native', accentCyan),
                _buildSkillChip('Node.js', const Color(0xFF339933)),
                _buildSkillChip('MongoDB', const Color(0xFF47A248)),
                _buildSkillChip('SQL', accentBlue),
                _buildSkillChip('Git & GitHub', Colors.white70),
                _buildSkillChip('Android Studio', const Color(0xFF3DDC84)),
                _buildSkillChip('Xcode', accentBlue),
                _buildSkillChip('Visual Studio', accentPurple),
                _buildSkillChip('Figma', const Color(0xFFF24E1E)),
              ],
            ),
          ),

          const SizedBox(height: spacingLG),

          // Experience Section
          _buildGlassCard(
            context,
            icon: FontAwesomeIcons.briefcase,
            title: 'EXPERIENCE',
            delay: 700,
            child: Column(
              children: [
                _buildExperienceItem(
                  context,
                  'Digitopolis',
                  'Unity & Flutter Developer',
                  'Dec 2020 – Aug 2024',
                  '3+ years',
                  [
                    'Developed mobile applications using Flutter: Insight wat pho, Thaiyarnyon, Museum, Good money',
                    'Created games using Unity: Little monster home, Yimsamer logistic, Tracter Game',
                    'Implemented augmented reality (AR) features for interactive experiences',
                    'Integrated RESTful APIs for backend communication',
                  ],
                  [FontAwesomeIcons.flutter, FontAwesomeIcons.gamepad],
                ),
                const SizedBox(height: spacingMD),
                _buildExperienceItem(
                  context,
                  'Atapy',
                  'Unity & React Native Developer',
                  'Mar 2019 – Nov 2020',
                  '1.5 years',
                  [
                    'Developed games: Pet Story, EN-Camp Power Plant, Little Slippies',
                    'Built Squarepier App using React Native',
                    'Collaborated with design teams on gameplay features and UI',
                  ],
                  [FontAwesomeIcons.gamepad, FontAwesomeIcons.react],
                ),
                const SizedBox(height: spacingMD),
                _buildExperienceItem(
                  context,
                  'Sanuk Games',
                  'Unity Developer',
                  'May 2018 – Feb 2019',
                  '1 year',
                  [
                    'Integrated equipment features into Pro Fishing Simulator',
                    'Developed merge colliders tools for 3D game objects',
                    'Worked on game mechanics and performance optimization',
                  ],
                  [FontAwesomeIcons.gamepad],
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
                  'Senior High School - Art Society Program',
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
              const SizedBox(width: spacingMD),
              _buildLinkButton(
                context,
                'LinkedIn',
                FontAwesomeIcons.linkedin,
                'https://linkedin.com/in/wimutti-wiratsil',
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
        const SizedBox(height: spacingMD),
        Row(
          children: [
            _buildRoleBadge('Flutter Developer', const Color(0xFF02569B),
                FontAwesomeIcons.flutter),
            const SizedBox(width: spacingSM),
            _buildRoleBadge(
                'Unity Developer', accentPurple, FontAwesomeIcons.gamepad),
          ],
        )
            .animate()
            .fade(delay: const Duration(milliseconds: 200))
            .slideX(begin: -0.3),
        const SizedBox(height: spacingMD),
        Row(
          children: [
            Icon(FontAwesomeIcons.locationDot, size: 14, color: bodyTextColor),
            const SizedBox(width: spacingXS),
            const Text(
              'Bangkok, Thailand',
              style: TextStyle(color: bodyTextColor, fontSize: 14),
            ),
            const SizedBox(width: spacingLG),
            Icon(FontAwesomeIcons.briefcase, size: 14, color: bodyTextColor),
            const SizedBox(width: spacingXS),
            const Text(
              '6+ Years Experience',
              style: TextStyle(color: bodyTextColor, fontSize: 14),
            ),
          ],
        )
            .animate()
            .fade(delay: const Duration(milliseconds: 300))
            .slideX(begin: -0.3),
      ],
    );
  }

  Widget _buildRoleBadge(String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingMD,
        vertical: spacingSM,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.2),
            color.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(radiusMD),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: spacingXS),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 13,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
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

  Widget _buildSkillSection(BuildContext context, String title, IconData icon,
      Color color, List<String> skills,
      {int delay = 0}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radiusLG),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(spacingLG),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(radiusLG),
            border: Border.all(
              color: color.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(spacingSM),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(radiusSM),
                    ),
                    child: Icon(icon, color: color, size: 18),
                  ),
                  const SizedBox(width: spacingSM),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: spacingLG),
              // Skills as chips
              Wrap(
                spacing: spacingSM,
                runSpacing: spacingSM,
                children: skills
                    .map((skill) => _buildCleanSkillChip(skill, color))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fade(delay: Duration(milliseconds: delay), duration: animationMedium)
        .slideY(begin: 0.2);
  }

  Widget _buildSkillSectionWithImage(BuildContext context, String title,
      String imagePath, Color color, List<String> skills,
      {int delay = 0}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radiusLG),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(spacingLG),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(radiusLG),
            border: Border.all(
              color: color.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(spacingSM),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(radiusSM),
                    ),
                    child: Image.asset(imagePath, width: 18, height: 18),
                  ),
                  const SizedBox(width: spacingSM),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: spacingLG),
              // Skills as chips
              Wrap(
                spacing: spacingSM,
                runSpacing: spacingSM,
                children: skills
                    .map((skill) => _buildCleanSkillChip(skill, color))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fade(delay: Duration(milliseconds: delay), duration: animationMedium)
        .slideY(begin: 0.2);
  }

  Widget _buildCleanSkillChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingMD,
        vertical: spacingSM,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(radiusMD),
        border: Border.all(
          color: color.withValues(alpha: 0.15),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color.withValues(alpha: 0.9),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSkillChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingMD,
        vertical: spacingSM,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(radiusLG),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildExperienceItem(
    BuildContext context,
    String company,
    String role,
    String date,
    String duration,
    List<String> responsibilities,
    List<IconData> icons,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          company,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(width: spacingSM),
                        ...icons.map((icon) => Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Icon(
                                icon,
                                size: 14,
                                color: icon == FontAwesomeIcons.flutter
                                    ? const Color(0xFF02569B)
                                    : icon == FontAwesomeIcons.gamepad
                                        ? accentPurple
                                        : accentCyan,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      role,
                      style: const TextStyle(
                        color: accentCyan,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      color: bodyTextColor.withValues(alpha: 0.8),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: spacingSM,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: accentBlue.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(radiusSM),
                    ),
                    child: Text(
                      duration,
                      style: const TextStyle(
                        color: accentBlue,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: spacingMD),
          ...responsibilities.map((resp) => Padding(
                padding: const EdgeInsets.only(bottom: spacingXS),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '•',
                      style: TextStyle(
                        color: accentCyan,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
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
                const SizedBox(height: 2),
                Text(
                  degree,
                  style: const TextStyle(color: bodyTextColor, fontSize: 13),
                ),
              ],
            ),
          ),
          Text(
            year,
            style: TextStyle(
              color: bodyTextColor.withValues(alpha: 0.7),
              fontSize: 12,
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
