import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';

class RiskSelectionStep extends StatelessWidget {
  final Function(int) onSelection;
  final int selectedIndex;
  final VoidCallback onProceed;

  const RiskSelectionStep({
    super.key,
    required this.onSelection,
    required this.selectedIndex,
    required this.onProceed,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      {
        'title': 'Conservative profile',
        'subtitle':
            'Conservative profile involves stable returns from proven strategies with minimal volatility.'
      },
      {
        'title': 'Steady growth profile',
        'subtitle':
            'Steady growth involves balanced gains with moderate fluctuations in strategy performance.'
      },
      {
        'title': 'Exponential growth profile',
        'subtitle':
            'It has potentials for significant gains or losses due to aggressive trading and market exposure.'
      },
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('What risk level are you comfortable exploring?',
                style: ktsHeadlineMedium),
            const SizedBox(height: 8),
            Text('Choose a level',
                style: ktsCaption.copyWith(color: kcSecondaryText)),
            const SizedBox(height: 16),
            ...List.generate(options.length, (i) {
              final option = options[i];
              final active = selectedIndex == i;
              return GestureDetector(
                onTap: () => onSelection(i),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: active
                        ? kcGradientStart.withOpacity(0.08)
                        : kcMediumGrey.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: active ? kcGradientStart : Colors.transparent,
                      width: active ? 2 : 0,
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(option['title']!,
                            style: ktsBodyText.copyWith(color: kcPrimaryText)),
                        const SizedBox(height: 6),
                        Text(option['subtitle']!,
                            style: ktsCaption.copyWith(color: kcSecondaryText)),
                      ]),
                ),
              );
            }),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedIndex >= 0 ? onProceed : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor:
                      selectedIndex >= 0 ? kcGradientStart : kcVeryLightGrey,
                ),
                child: Text('Proceed',
                    style: ktsBodyText.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
