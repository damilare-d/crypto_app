import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';

class OnboardStep extends StatelessWidget {
  final int indicatorActiveCount; // 1 or 2
  final String headline;
  final String caption;
  final String imageUrl;
  final String ctaText;
  final LinearGradient buttonGradient;
  final VoidCallback onPrimaryPressed;

  const OnboardStep({
    super.key,
    required this.indicatorActiveCount,
    required this.headline,
    required this.caption,
    required this.imageUrl,
    required this.ctaText,
    required this.buttonGradient,
    required this.onPrimaryPressed,
  });

  @override
  Widget build(BuildContext context) {
    // small indicator row with two small rectangles
    Widget indicators() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 6,
              decoration: BoxDecoration(
                color: indicatorActiveCount >= 1
                    ? kcGradientStart
                    : kcVeryLightGrey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 6,
              decoration: BoxDecoration(
                color: indicatorActiveCount >= 2
                    ? kcGradientStart
                    : kcVeryLightGrey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            indicators(),
            const SizedBox(height: 24),
            Text(headline, style: ktsHeadlineMedium),
            const SizedBox(height: 12),
            Text(caption, style: ktsCaption.copyWith(color: kcSecondaryText)),
            const SizedBox(height: 36),
            Expanded(
              child: Center(
                child: Image(image: AssetImage(imageUrl)),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () {
                  // watch how-to video: placeholder
                },
                child: Text(ctaText,
                    style: ktsCaption.copyWith(color: kcActiveIconColor)),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPrimaryPressed,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  // backgroundColor replaced by gradient using Ink
                  backgroundColor: Colors.transparent,
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: buttonGradient,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text('Get started',
                        style: ktsBodyText.copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
