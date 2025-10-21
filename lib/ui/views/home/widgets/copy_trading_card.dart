import 'package:flutter/material.dart';

import '../../../common/text_styles.dart';

class CopyTradingCard extends StatelessWidget {
  final void Function()? onTap;
  const CopyTradingCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFEC536), Color(0xFF98AAFE), Color(0xFF6179FA)],
            stops: [0.0, 0.44, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Copy Trading',
              style: ktsBodyText.copyWith(fontSize: 16, color: Colors.black)),
          const SizedBox(height: 8),
          Text(
            'Discover our latest feature. Follow and watch the PRO traders closely and win like a PRO! We are rooting for you!',
            style: ktsCaption.copyWith(color: Colors.black),
          ),
        ]),
      ),
    );
  }
}
