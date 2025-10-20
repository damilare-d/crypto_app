import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';
import '../home_viewmodel.dart';

class QuickActionContainer extends StatelessWidget {
  final HomeViewModel vm;
  const QuickActionContainer({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kcMediumGrey.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: vm.quickActions.map((a) {
              final idx = vm.quickActions.indexOf(a);
              return Column(
                children: [
                  GestureDetector(
                    onTap: () => vm.onQuickActionTap(a['title']),
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        color: kcDarkGreyColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(a['icon'], color: kcPrimaryText),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(a['title'],
                      style: ktsCaption.copyWith(color: kcSecondaryText)),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => vm.onTopIconTap('see_more'),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFB5D1FF).withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text('See more',
                  style: TextStyle(color: Color(0xFFB5D1FF))),
            ),
          )
        ],
      ),
    );
  }
}
