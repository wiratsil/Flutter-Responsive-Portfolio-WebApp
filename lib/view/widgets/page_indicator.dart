import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import '../../res/constants.dart';

/// Page indicator dots
class PageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  const PageIndicator({
    super.key,
    required this.pageCount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingSM,
        vertical: spacingMD,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(radiusXL),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(pageCount, (index) {
          final isActive = index == currentPage;
          return GestureDetector(
            onTap: () {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: AnimatedContainer(
              duration: animationFast,
              margin: const EdgeInsets.symmetric(vertical: spacingXS),
              width: isActive ? 12 : 8,
              height: isActive ? 12 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isActive ? glowGradient : null,
                color: isActive ? null : Colors.white.withValues(alpha: 0.3),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: accentPink.withValues(alpha: 0.5),
                          blurRadius: 8,
                        ),
                      ]
                    : null,
              ),
            ),
          );
        }),
      ),
    );
  }
}

/// Stateful wrapper that listens to page changes
class AnimatedPageIndicator extends StatefulWidget {
  final int pageCount;

  const AnimatedPageIndicator({super.key, required this.pageCount});

  @override
  State<AnimatedPageIndicator> createState() => _AnimatedPageIndicatorState();
}

class _AnimatedPageIndicatorState extends State<AnimatedPageIndicator> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    controller.removeListener(_onPageChanged);
    super.dispose();
  }

  void _onPageChanged() {
    if (mounted) {
      setState(() {
        _currentPage = controller.page?.round() ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageIndicator(
      pageCount: widget.pageCount,
      currentPage: _currentPage,
    );
  }
}
