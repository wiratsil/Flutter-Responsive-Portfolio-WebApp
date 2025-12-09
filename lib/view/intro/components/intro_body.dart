import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import 'animated_texts_componenets.dart';
import 'combine_subtitle.dart';
import 'description_text.dart';
import 'download_button.dart';
import 'headline_text.dart';
import 'side_menu_button.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        // Main content centered
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isDesktop(context)
                    ? size.width * 0.08
                    : defaultPadding,
              ),
              child: Responsive.isDesktop(context)
                  ? _buildDesktopLayout(context, size)
                  : _buildMobileLayout(context, size),
            ),
          ),
        ),
        // Menu button at top-left
        if (!Responsive.isLargeMobile(context))
          Positioned(
            left: size.width * 0.02,
            top: size.height * 0.4,
            child: MenuButton(
              onTap: () => Scaffold.of(context).openDrawer(),
            )
                .animate()
                .fade(duration: const Duration(milliseconds: 500))
                .slideX(begin: -0.5),
          ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Left side - Text content
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyPortfolioText(start: 40, end: 50)
                  .animate()
                  .fade(duration: const Duration(milliseconds: 500))
                  .slideX(begin: -0.3),
              const SizedBox(height: spacingSM),
              const CombineSubtitleText()
                  .animate()
                  .fade(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 200))
                  .slideX(begin: -0.3),
              const SizedBox(height: spacingMD),
              const AnimatedDescriptionText(start: 14, end: 15)
                  .animate()
                  .fade(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 400))
                  .slideX(begin: -0.3),
              const SizedBox(height: spacingXL),
              const DownloadButton()
                  .animate()
                  .fade(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 600))
                  .slideX(begin: -0.3),
            ],
          ),
        ),
        const SizedBox(width: spacingXXL),
        // Right side - Image
        Expanded(
          flex: 4,
          child: const Center(
            child: AnimatedImageContainer(),
          )
              .animate()
              .fade(
                  duration: const Duration(milliseconds: 600),
                  delay: const Duration(milliseconds: 300))
              .scale(begin: const Offset(0.8, 0.8)),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: size.height * 0.05),
        // Image at top for mobile
        const AnimatedImageContainer(
          width: 180,
          height: 230,
        )
            .animate()
            .fade(duration: const Duration(milliseconds: 500))
            .scale(begin: const Offset(0.8, 0.8)),
        SizedBox(height: size.height * 0.05),
        // Text content centered
        Responsive(
          desktop: const MyPortfolioText(start: 40, end: 50),
          largeMobile: const MyPortfolioText(start: 35, end: 30),
          mobile: const MyPortfolioText(start: 30, end: 25),
          tablet: const MyPortfolioText(start: 45, end: 38),
        )
            .animate()
            .fade(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 200))
            .slideY(begin: 0.3),
        const SizedBox(height: spacingSM),
        const CombineSubtitleText()
            .animate()
            .fade(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 300))
            .slideY(begin: 0.3),
        const SizedBox(height: spacingMD),
        Responsive(
          desktop: const AnimatedDescriptionText(start: 14, end: 15),
          largeMobile: const AnimatedDescriptionText(start: 12, end: 11),
          mobile: const AnimatedDescriptionText(start: 11, end: 10),
          tablet: const AnimatedDescriptionText(start: 14, end: 13),
        )
            .animate()
            .fade(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 400))
            .slideY(begin: 0.3),
        const SizedBox(height: spacingXL),
        const DownloadButton()
            .animate()
            .fade(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 500))
            .slideY(begin: 0.3),
        SizedBox(height: size.height * 0.05),
      ],
    );
  }
}
