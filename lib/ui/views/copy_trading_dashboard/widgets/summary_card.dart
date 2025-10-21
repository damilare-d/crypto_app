import 'package:crypto_app/ui/common/app_colors.dart';
import 'package:crypto_app/ui/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../copy_trading_dashboard_viewmodel.dart';

class SummaryCard extends ViewModelWidget<CopyTradingDashboardViewModel> {
  final CopyTradingDashboardViewModel vm;
  const SummaryCard({required this.vm, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CopyTradingDashboardViewModel viewModel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kcMediumGrey.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Copy trading assets',
            style: ktsCaption.copyWith(color: kcSecondaryText)),
        const SizedBox(height: 6),
        Text('\$5,564.96', style: ktsBodyText.copyWith(color: kcPrimaryText)),
        const SizedBox(height: 8),
        const Divider(color: Colors.white24),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Net profit',
                  style: ktsCaption.copyWith(color: kcSecondaryText)),
              const SizedBox(height: 4),
              Text('\$1,234.12',
                  style: ktsBodyText.copyWith(color: kcPrimaryText)),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('Today\'s PNL',
                  style: ktsCaption.copyWith(color: kcSecondaryText)),
              const SizedBox(height: 4),
              Text(
                '+207.25',
                style: ktsBodyText.copyWith(color: const Color(0xFF17B26A)),
              ),
            ])
          ],
        )
      ]),
    );
  }
}
