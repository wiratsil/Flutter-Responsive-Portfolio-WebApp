import 'package:flutter/material.dart';

// === PREMIUM COLOR PALETTE ===
const primaryColor = Colors.white;
const secondaryColor = Color(0xFF242430);
const darkColor = Color(0xFF191923);
const bodyTextColor = Color(0xFFB8B8BB);
const bgColor = Color(0xFF0A0A0F);

// === ACCENT COLORS ===
const accentPink = Color(0xFFFF006E);
const accentBlue = Color(0xFF3A86FF);
const accentPurple = Color(0xFF8338EC);
const accentCyan = Color(0xFF00F5D4);
const accentGold = Color(0xFFFFD60A);

// === GRADIENT DEFINITIONS ===
const premiumGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFFF006E),
    Color(0xFF8338EC),
    Color(0xFF3A86FF),
  ],
);

const glowGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFFF006E),
    Color(0xFF3A86FF),
  ],
);

const subtleGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF1A1A2E),
    Color(0xFF0A0A0F),
  ],
);

const cardGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF1F1F2E),
    Color(0xFF15151F),
  ],
);

// === GLASSMORPHISM COLORS ===
const glassColor = Color.fromRGBO(255, 255, 255, 0.05);
const glassBorderColor = Color.fromRGBO(255, 255, 255, 0.1);

// === SPACING ===
const defaultPadding = 20.0;
const spacingXS = 4.0;
const spacingSM = 8.0;
const spacingMD = 16.0;
const spacingLG = 24.0;
const spacingXL = 32.0;
const spacingXXL = 48.0;

// === BORDER RADIUS ===
const radiusSM = 8.0;
const radiusMD = 12.0;
const radiusLG = 16.0;
const radiusXL = 24.0;
const radiusXXL = 32.0;

// === SHADOWS ===
List<BoxShadow> glowShadow({Color color = accentPink, double blur = 20}) => [
      BoxShadow(
        color: color.withValues(alpha: 0.3),
        blurRadius: blur,
        spreadRadius: 0,
      ),
    ];

List<BoxShadow> premiumShadow = [
  BoxShadow(
    color: accentPink.withValues(alpha: 0.3),
    offset: const Offset(-2, 0),
    blurRadius: 20,
  ),
  BoxShadow(
    color: accentBlue.withValues(alpha: 0.3),
    offset: const Offset(2, 0),
    blurRadius: 20,
  ),
];

// === ANIMATION DURATIONS ===
const animationFast = Duration(milliseconds: 200);
const animationMedium = Duration(milliseconds: 350);
const animationSlow = Duration(milliseconds: 500);
const animationVerySlow = Duration(milliseconds: 800);
