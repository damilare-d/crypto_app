import 'package:flutter/material.dart';
import 'package:crypto_app/ui/common/app_colors.dart';

const String _fontEncodeSans = 'EncodeSans';
const String _fontInter = 'Inter';

/// Base Text Styles

/// 1️⃣ Body / Default text
const TextStyle ktsBodyText = TextStyle(
  fontSize: 14,
  height: 24 / 14,
  fontWeight: FontWeight.w700, // Bold
  fontFamily: _fontEncodeSans,
  color: kcSecondaryText,
);

/// 2️⃣ Medium Headline
const TextStyle ktsHeadlineMedium = TextStyle(
  fontSize: 24,
  height: 32 / 24,
  fontWeight: FontWeight.w800, // Extra Bold
  fontFamily: _fontEncodeSans,
  color: kcPrimaryText,
);

/// 3️⃣ Caption / Small Text
const TextStyle ktsCaption = TextStyle(
  fontSize: 12,
  height: 18 / 12,
  fontWeight: FontWeight.w400, // Regular
  fontFamily: _fontInter,
  color: kcSecondaryText,
);
