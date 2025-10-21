import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';
import '../home_viewmodel.dart';

class BalanceCard extends StatelessWidget {
  final HomeViewModel vm;
  const BalanceCard({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: kcDarkGreyColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // top-right small radius visual already implied by container design
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your ${vm.flags[vm.selectedFlagIndex]['code']} balance',
                style: ktsCaption.copyWith(color: kcSecondaryText)),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: vm.toggleBalanceVisibility,
              child: Icon(
                  vm.isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                  color: kcPrimaryText,
                  size: 18),
            )
          ],
        ),
        const SizedBox(height: 8),
        // main currency + decimals variant
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(vm.currentSymbol,
                  style: ktsHeadlineMedium.copyWith(
                      color: kcPrimaryText, fontSize: 32)),
              const SizedBox(width: 6),
              Text(
                vm.isBalanceVisible ? '1,234' : '•••',
                style: ktsHeadlineMedium.copyWith(
                    color: kcPrimaryText, fontSize: 32),
              ),
              const SizedBox(width: 6),
              Text(vm.isBalanceVisible ? '.00' : '',
                  style: ktsCaption.copyWith(color: kcSecondaryText)),
            ],
          ),
        ),
      ]),
    );
  }
}
