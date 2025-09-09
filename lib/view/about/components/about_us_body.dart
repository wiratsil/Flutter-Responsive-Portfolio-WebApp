import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WIMUTTI WIRATSIL',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 60.0, color: Colors.white),
          )
              .animate()
              .fade(duration: const Duration(milliseconds: 500))
              .slide(begin: const Offset(-1, 0))
              .shimmer(duration: const Duration(seconds: 2), color: Colors.white), // Added shimmer
          const SizedBox(height: defaultPadding / 2),
          Text(
            'FLUTTER AND UNITY DEVELOPER',
            style: Theme.of(context).textTheme.titleMedium,
          )
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 100))
              .slide(begin: const Offset(-1, 0))
              .blur(duration: const Duration(milliseconds: 500), begin: const Offset(10, 10), end: Offset.zero)
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 100))
              .slide(begin: const Offset(-1, 0))
              .blur(duration: const Duration(milliseconds: 500), begin: const Offset(10, 10), end: Offset.zero), // Added blur
          const SizedBox(height: defaultPadding * 2),
          _buildSectionTitle(context, 'PROFESSIONAL SUMMARY')
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 200))
              .slide(begin: const Offset(-1, 0)),
          const SizedBox(height: defaultPadding),
          const Text(
            'Experienced Flutter and Unity Developer with over 6 years of experience in mobile app and game development. Proficient in creating and optimizing 2D/3D games using Unity, and developing cross-platform mobile applications using Flutter. Demonstrated ability to deliver high-quality products with several apps and games successfully published on Google Play and the App Store. Skilled in collaborating with teams to create seamless and engaging user experiences.',
          )
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 300))
              .slide(begin: const Offset(-1, 0)),
          const SizedBox(height: defaultPadding * 2),
          _buildSectionTitle(context, 'SKILLS')
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 400))
              .slide(begin: const Offset(-1, 0)),
          const SizedBox(height: defaultPadding),
          _buildSkillCategory(
            context,
            'Programming Languages',
            'Proficient in a variety of languages for diverse development needs.',
            'C#, Dart, Java, Node.js, SQL, C++, HTML, CSS, Go',
            iconPath: 'assets/icons/dart.png', // Added iconPath
          )
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 500))
              .slide(begin: const Offset(-1, 0)),
          _buildSkillCategory(
            context,
            'Frameworks & Libraries',
            'Experienced with leading frameworks for efficient and robust development.',
            'Flutter, AR Foundation, Photon Network, React Native, MongoDB',
            iconPath: 'assets/icons/flutter.png', // Added iconPath
          )
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 600))
              .slide(begin: const Offset(-1, 0)),
          _buildSkillCategory(
            context,
            'Tools',
            'Adept at using industry-standard tools for streamlined workflows.',
            'Unity, Android Studio, Xcode, Visual Studio, GitHub, Sourcetree',
            iconPath: 'assets/icons/bloc.png', // Added iconPath (example)
          )
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 700))
              .slide(begin: const Offset(-1, 0)),
          _buildSkillCategory(
            context,
            'Languages',
            'Fluent in native language with foundational English skills.',
            'Thai (Native), English (Beginner)',
          )
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 800))
              .slide(begin: const Offset(-1, 0)),
          const SizedBox(height: defaultPadding * 2),
          _buildSectionTitle(context, 'EXPERIENCE')
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 900))
              .slide(begin: const Offset(-1, 0)),
          const SizedBox(height: defaultPadding),
          _buildExperienceItem(
            context,
            'Digitopolis - Unity & Flutter Developer',
            'Dec 2020 – Aug 2024',
            [
              'Developed mobile applications and games, including: Insight wat pho, Thaiyarnyon, Museum, Good money, Dummy pueak admin App using Flutter. Little monster home, Yimsamer logistic, Tracter Game using Unity.',
              'Designed user interfaces and core gameplay mechanics for both mobile apps and games.',
              'Integrated RESTful APIs for backend communication and real-time data synchronization.',
              'Optimized performance for smooth operation on multiple platforms.',
              'Implemented augmented reality (AR) features to enhance user engagement with interactive experiences.',
            ],
          )
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 1000))
              .slide(begin: const Offset(-1, 0)),
          _buildExperienceItem(
            context,
            'Atapy - Unity & React Native Developer',
            'Mar 2019 – Nov 2020',
            [
              'Developed various games using Unity, including: Pet Story, EN-Camp Power Plant, Little Slippies Game using Unity. Squarepier App using React Native.',
              'Collaborated closely with design teams to implement core gameplay features and user interfaces.',
            ],
          )
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 1100))
              .slide(begin: const Offset(-1, 0)),
          _buildExperienceItem(
            context,
            'Sanuk Games - Unity Developer',
            'May 2018 – Feb 2019',
            [
              'Integrated equipment features into Pro Fishing Simulator.',
              'Developed and tested new mechanics, enhancing the overall gameplay experience.',
              'Developed merge colliders tools for managing in3D game objects.',
            ],
          )
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 1200))
              .slide(begin: const Offset(-1, 0)),
          _buildExperienceItem(
            context,
            'Sanuk Games - Unity Developer (Internship)',
            'Jan – Apr 2018',
            [
              'Assisted in integrating equipment features into Pro Fishing Simulator.',
              'Supported testing and feature implementation to improve gameplay functionality.',
            ],
          )
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 1300))
              .slide(begin: const Offset(-1, 0)),
          const SizedBox(height: defaultPadding * 2),
          _buildSectionTitle(context, 'EDUCATION')
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 1400))
              .slide(begin: const Offset(-1, 0)),
          const SizedBox(height: defaultPadding),
          _buildEducationItem(context, 'Dhurakij Pundit University',
                  'B.Eng in Digital media and game system (2014-2018)')
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 1500))
              .slide(begin: const Offset(-1, 0)),
          _buildEducationItem(context, 'Benchamabophit School',
                  'Senior High School in Art-society Program (2011-2013)')
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 1600))
              .slide(begin: const Offset(-1, 0)),
          _buildEducationItem(context, 'Benchamabophit School',
                  'Junior High School (2008 – 2010)')
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 1700))
              .slide(begin: const Offset(-1, 0)),
          const SizedBox(height: defaultPadding * 2),
          _buildLink(context, 'CHECK OUT MY PORTFOLIO',
                  'https://wimutti-portfolio.netlify.app/')
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 1800))
              .slide(begin: const Offset(-1, 0)),
          const SizedBox(height: defaultPadding),
          _buildLink(context, 'GITHUB', 'https://github.com/wiratsil')
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 1900))
              .slide(begin: const Offset(-1, 0)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSkillCategory(BuildContext context, String category,
      String description, String skills, {String? iconPath}) { // Modified signature
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (iconPath != null) ...[ // Added icon display logic
                if (iconPath.endsWith('.svg'))
                  SvgPicture.asset(iconPath, height: 24, width: 24)
                else
                  Image.asset(iconPath, height: 24, width: 24),
                const SizedBox(width: defaultPadding / 2),
              ],
              Text(
                category,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(description, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: defaultPadding / 4),
          Text(skills),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(BuildContext context, String title, String date,
      List<String> responsibilities) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          Text(date, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: defaultPadding / 2),
          ...responsibilities
              .map((resp) => Padding(
                    padding: const EdgeInsets.only(
                        left: defaultPadding, bottom: defaultPadding / 4),
                    child: Text('• $resp'),
                  ))
              ,
        ],
      ),
    );
  }

  Widget _buildEducationItem(
      BuildContext context, String school, String degree) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(school,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          Text(degree),
        ],
      ),
    );
  }

  Widget _buildLink(BuildContext context, String title, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.blue, decoration: TextDecoration.underline),
      ),
    );
  }
}