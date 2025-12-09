import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/intro_body.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    // ไม่ใช้ Scaffold ซ้อน เพื่อให้ MenuButton สามารถเปิด Drawer จาก MainView ได้
    return const IntroBody();
  }
}
