import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../model/certificate_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/certification_controller.dart';
import '../../projects/components/title_text.dart';
import 'certificates_details.dart';
import '../../../view model/responsive.dart';

class CertificateGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  CertificateGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});
  final controller = Get.put(CertificationController());

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isLargeMobile(context))
                const SizedBox(height: defaultPadding),
              const TitleText(prefix: 'Certifications &', title: 'License')
                  .animate()
                  .fade(duration: const Duration(milliseconds: 500))
                  .slide(begin: const Offset(0, -0.5)),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Obx(() => _CertificateCard(
                        index: index,
                        isHovered: controller.hovers[index],
                        onHover: (hovered) =>
                            controller.onHover(index, hovered),
                      ))
                  .animate()
                  .fade(
                    duration: const Duration(milliseconds: 500),
                    delay: Duration(milliseconds: 100 * index),
                  )
                  .scale(
                    begin: const Offset(0.9, 0.9),
                    end: const Offset(1, 1),
                    delay: Duration(milliseconds: 100 * index),
                  );
            },
            childCount: certificateList.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: ratio,
          ),
        ),
      ],
    );
  }
}

class _CertificateCard extends StatefulWidget {
  final int index;
  final bool isHovered;
  final Function(bool) onHover;

  const _CertificateCard({
    required this.index,
    required this.isHovered,
    required this.onHover,
  });

  @override
  State<_CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<_CertificateCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: animationMedium,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _CertificateCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isHovered != oldWidget.isHovered) {
      if (widget.isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => widget.onHover(true),
      onExit: (_) => widget.onHover(false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: animationMedium,
              margin: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radiusXL),
                gradient: widget.isHovered
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [accentCyan, accentBlue, accentPurple],
                      )
                    : const LinearGradient(
                        colors: [
                          Color(0xFF2A2A40),
                          Color(0xFF1A1A2E),
                        ],
                      ),
                boxShadow: [
                  BoxShadow(
                    color: accentCyan.withValues(
                        alpha: widget.isHovered ? 0.4 : 0.1),
                    offset: const Offset(-4, 0),
                    blurRadius: widget.isHovered ? 30 : 15,
                  ),
                  BoxShadow(
                    color: accentPurple.withValues(
                        alpha: widget.isHovered ? 0.4 : 0.1),
                    offset: const Offset(4, 0),
                    blurRadius: widget.isHovered ? 30 : 15,
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(radiusXL - 2),
                ),
                child: CertificateStack(index: widget.index),
              ),
            ),
          );
        },
      ),
    );
  }
}
