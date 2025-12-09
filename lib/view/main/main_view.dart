import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/main/components/navigation_bar.dart';
import 'package:flutter_portfolio/view/widgets/animated_background.dart';
import 'package:flutter_portfolio/view/widgets/app_footer.dart';
import 'package:flutter_portfolio/view/widgets/floating_social_links.dart';
import 'package:flutter_portfolio/view/widgets/page_indicator.dart';
import '../../view model/responsive.dart';
import 'components/drawer/drawer.dart';
import 'components/navigation_button_list.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MainView extends StatelessWidget {
  const MainView({super.key, required this.pages});
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      drawer: const CustomDrawer(),
      body: AnimatedBackground(
        particleCount: 25,
        child: Stack(
          children: [
            // Main content
            Column(
              children: [
                kIsWeb && !Responsive.isLargeMobile(context)
                    ? const SizedBox(height: defaultPadding * 2)
                    : const SizedBox(height: defaultPadding / 2),
                const SizedBox(
                  height: 80,
                  child: TopNavigationBar(),
                ),
                if (Responsive.isLargeMobile(context))
                  const Row(
                    children: [Spacer(), NavigationButtonList(), Spacer()],
                  ),
                Expanded(
                  flex: 9,
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [...pages],
                  ),
                ),
                // Footer
                const AppFooter(),
              ],
            ),
            // Page indicator on the right
            if (Responsive.isDesktop(context))
              Positioned(
                right: size.width * 0.02,
                top: 0,
                bottom: 0,
                child: Center(
                  child: AnimatedPageIndicator(pageCount: pages.length),
                ),
              ),
            // Floating social links on the right bottom
            if (Responsive.isDesktop(context))
              Positioned(
                right: size.width * 0.02,
                bottom: 80,
                child: const FloatingSocialLinks(),
              ),
          ],
        ),
      ),
    );
  }
}
