import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio/view/projects/components/project_info.dart';
import 'package:get/get.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/projects_controller.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import '../../../view model/responsive.dart';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  ProjectGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});
  final controller = Get.put(ProjectController());

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
              const TitleText(prefix: 'Featured', title: 'Projects')
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
              return Obx(() => _ProjectCard(
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
            childCount: projectList.length,
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

class _ProjectCard extends StatefulWidget {
  final int index;
  final bool isHovered;
  final Function(bool) onHover;

  const _ProjectCard({
    required this.index,
    required this.isHovered,
    required this.onHover,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: animationMedium,
    );
    _rotateAnimation = Tween<double>(begin: 0, end: 0.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
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
  void didUpdateWidget(covariant _ProjectCard oldWidget) {
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
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_rotateAnimation.value)
              ..scale(_scaleAnimation.value),
            child: AnimatedContainer(
              duration: animationMedium,
              margin: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radiusXL),
                gradient: widget.isHovered
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [accentPink, accentPurple, accentBlue],
                      )
                    : const LinearGradient(
                        colors: [
                          Color(0xFF2A2A40),
                          Color(0xFF1A1A2E),
                        ],
                      ),
                boxShadow: [
                  BoxShadow(
                    color: accentPink.withValues(
                        alpha: widget.isHovered ? 0.4 : 0.1),
                    offset: const Offset(-4, 0),
                    blurRadius: widget.isHovered ? 30 : 15,
                  ),
                  BoxShadow(
                    color: accentBlue.withValues(
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
                child: ProjectStack(index: widget.index),
              ),
            ),
          );
        },
      ),
    );
  }
}
