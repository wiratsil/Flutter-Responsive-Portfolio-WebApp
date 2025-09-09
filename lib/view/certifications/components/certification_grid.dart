import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../model/certificate_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/certification_controller.dart';
import '../../projects/components/title_text.dart'; // Import TitleText
import 'certificates_details.dart';
import '../../../view model/responsive.dart'; // Import Responsive

class CertificateGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  CertificateGrid({super.key, this.crossAxisCount = 3,  this.ratio=1.3});
  final controller = Get.put(CertificationController());
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(Responsive.isLargeMobile(context))const SizedBox(
                height: defaultPadding,
              ),
              const TitleText(prefix: 'Certifications & ', title: 'License').animate().fade(duration: const Duration(milliseconds: 500)).slide(begin: const Offset(0, -1)),
              const SizedBox(
                height: defaultPadding,
              ),
            ],
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Obx(() => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(
                      vertical: defaultPadding, horizontal: defaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(colors: [
                        Colors.pinkAccent,
                        Colors.blue,
                      ]),
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.pink,
                          offset: const Offset(-2, 0),
                          blurRadius: controller.hovers[index] ? 20 : 10,
                        ),
                        BoxShadow(
                          color: Colors.blue,
                          offset: const Offset(2, 0),
                          blurRadius: controller.hovers[index] ? 20 : 10,
                        ),
                      ]),
                  child: CertificateStack(index: index)
              )).animate().fade(duration: const Duration(milliseconds: 500), delay: Duration(milliseconds: 100 * index));
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